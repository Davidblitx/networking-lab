**Questions to answer:**

## 1. What is the difference between HTTP and HTTPS?
HTTP (Hypertext Transfer Protocol) and HTTPS (HTTP Secure) differ primarily in security; HTTPS uses SSL/TLS certificates to encrypt data, while HTTP transmits information in plain text. HTTPS protects against eavesdropping, operates on port 443, and improves SEO, whereas HTTP uses port 80 and is vulnerable to attacks. 

## 2. What is TLS? (Don't say "it's encryption" — explain what it actually does)
TLS (Transport Layer Security) is a security protocol that creates a trusted, private, and tamper-proof pipe for data traveling between two points (such as your browser and a web server). TLS performs three core functions; Authentication, Integrity, Confidentiality(Secure Transport).

## 3. Walk through the TLS handshake step by step
The TLS handshake establishes a secure, encrypted connection between a client and server, typically following these steps: Client Hello (proposes TLS version/ciphers), Server Hello (selects parameters + certificate), Authentication (client validates certificate), Key Exchange (session keys created), and Finished (encrypted handshake confirmation). 

## 4. What is a certificate? What problem does it solve?
A digital certificate (often called a public key certificate or identity certificate) is an electronic document that acts as an "online passport" or digital ID. It proves the authenticity of a website, server, user, or entity by linking a public key to their identity, signed by a trusted third party known as a Certificate Authority (CA). 

Without digital certificates, online communication is vulnerable because there is no guarantee that you are talking to who you think you are.

## 5. What is a Certificate Authority (CA)?
A Certificate Authority (CA) is a trusted, third-party organization that validates identities and issues digital certificates (like SSL/TLS) to secure online communication.

## 6. Why does your browser show a warning for expired certificates?
A browser shows a warning for expired certificates to protect users from potential security risks when a website's SSL/TLS certificate—which validates its identity and enables encryption—has lapsed. 