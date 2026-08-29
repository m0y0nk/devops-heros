# Task 1: Docker Custom Network — Multi-Container Communication

## Objective

Demonstrate how Docker custom bridge networks enable **DNS-based container communication**, and how containers on **different networks are isolated** from each other unless explicitly connected.

---

## Step 1: Create Custom Bridge Networks

Create two separate custom bridge networks — one for the frontend tier and one for the database tier:

```bash
docker network create frontendNetwork
docker network create dbNetwork
```

Verify the networks were created:

```bash
docker network ls
```

![Networks created and listed](image.png)

---

## Step 2: Launch Containers on Separate Networks

Run two Alpine containers, each attached to a different custom network:

```bash
docker run -dit --name frontendContainer --network frontendNetwork alpine
docker run -dit --name dbContainer --network dbNetwork alpine
```

Confirm both containers are running:

```bash
docker ps
```

![Containers running on separate networks](image-1.png)

---

## Step 3: Verify Network Isolation

Since `frontendContainer` and `dbContainer` are on **different** custom networks, they should **not** be able to reach each other by name.

### Ping from `frontendContainer` → `dbContainer`

```bash
docker exec -it frontendContainer sh
# Inside the container:
ping dbContainer
# Result: ping: bad address 'dbContainer'
```

![Ping fails from frontendContainer to dbContainer](image-2.png)

### Ping from `dbContainer` → `frontendContainer`

```bash
docker exec -it dbContainer sh
# Inside the container:
ping frontendContainer
# Result: ping: bad address 'frontendContainer'
```

![Ping fails from dbContainer to frontendContainer](image-3.png)

> **Takeaway:** Containers on different custom bridge networks are fully isolated — they cannot resolve or communicate with each other.

---

## Step 4: Add a Third Container to the Frontend Network

Launch a `backendContainer` on the `frontendNetwork`:

```bash
docker run -dit --name backendContainer --network frontendNetwork alpine
```

Verify all three containers are running:

```bash
docker ps
```

![Three containers running](image-4.png)

---

## Step 5: Connect `backendContainer` to Both Networks

To allow the backend to communicate with **both** the frontend and database tiers, attach it to the `dbNetwork` as well:

```bash
docker network connect dbNetwork backendContainer
```

Inspect the container to confirm it now has interfaces on **both** networks:

```bash
docker inspect backendContainer
```

![Connecting backendContainer to dbNetwork and inspecting](image-6.png)

### Inspect Output — Network Settings

The `backendContainer` now shows two entries under `NetworkSettings.Networks`:

- **`frontendNetwork`** — IP `172.18.0.3`, Gateway `172.18.0.1`
- **`dbNetwork`** — IP `172.19.0.3`, Gateway `172.19.0.1`

![backendContainer on frontendNetwork](image-5.png)

![backendContainer on both networks](image-7.png)

---

## Step 6: Verify Cross-Network Connectivity via `backendContainer`

Since `backendContainer` is now connected to **both** networks, it can reach containers on either side.

### From `backendContainer` — ping both peers

```bash
docker exec -it backendContainer sh
# Inside the container:
ping frontendContainer   # ✅ Reachable (same frontendNetwork)
ping dbContainer          # ✅ Reachable (same dbNetwork)
```

![backendContainer can ping both frontendContainer and dbContainer](image-8.png)

### From `frontendContainer` — ping `backendContainer`

```bash
docker exec -it frontendContainer sh
# Inside the container:
ping backendContainer   # ✅ Reachable (same frontendNetwork)
```

![frontendContainer can ping backendContainer](image-9.png)

---

## Summary

| Scenario | Result | Reason |
|---|---|---|
| `frontendContainer` ↔ `dbContainer` | ❌ Unreachable | Different networks, no shared bridge |
| `backendContainer` ↔ `frontendContainer` | ✅ Reachable | Both on `frontendNetwork` |
| `backendContainer` ↔ `dbContainer` | ✅ Reachable | Both on `dbNetwork` |
| `frontendContainer` ↔ `dbContainer` (via backend) | ❌ Still isolated | No direct route; backend doesn't act as a router |

### Key Learnings

1. **Custom bridge networks** provide automatic **DNS resolution** between containers on the same network.
2. **Network isolation** is enforced by default — containers on different custom networks cannot communicate.
3. A container can be attached to **multiple networks** using `docker network connect`, making it a bridge point between tiers.
4. This pattern mirrors real-world **multi-tier architectures** (frontend → backend → database) where the backend connects to both tiers while keeping frontend and database isolated from each other.
