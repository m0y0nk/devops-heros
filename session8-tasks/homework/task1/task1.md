# Task 1

## Creating Custom Bridge Networks

Creating one container for the frontend and one for the database:

![Networks created and listed](image.png)

---

## Running Containers on Separate Networks

Running two Alpine containers (named frontendContainer and dbContainer), each attached their custom network:

![Containers running on separate networks](image-1.png)

---

## Verify Network Isolation

### Ping from frontendContainer → dbContainer

![Ping fails from frontendContainer to dbContainer](image-2.png)

### Ping from dbContainer → frontendContainer

![Ping fails from dbContainer to frontendContainer](image-3.png)

---

## Add backend Container to the Frontend Network


![Three containers running](image-4.png)

---

## Connecting backendContainer to Both Networks

![Connecting backendContainer to dbNetwork and inspecting](image-6.png)

### Inspect Frontend and Backend Containers


![backendContainer on frontendNetwork](image-5.png)

![backendContainer on both networks](image-7.png)

---

## Checking backendContainer's Connectivity

![backendContainer can ping both frontendContainer and dbContainer](image-8.png)

### From frontendContainer : ping backendContainer

![frontendContainer can ping backendContainer](image-9.png)
