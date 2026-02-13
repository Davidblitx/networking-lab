## Firewall Management (UFW)
I implemented a **Default Deny** security posture using UFW to demonstrate stateful packet inspection and port management.

### Applied Configuration:
* **SSH (22/TCP):** ALLOWED (Management access).
* **HTTP/HTTPS (80, 443/TCP):** ALLOWED (Web traffic).
* **MySQL (3306/TCP):** DENIED (Database hardening).

### Verification
To verify the active rules and logging state, I utilized:
`sudo ufw status verbose`