**Questions to answer:**

## 1. What is DNS? What problem does it solve?
The Domain Name System (DNS) is often referred to as the "phonebook of the internet.

DNS solves the fundamental challenge of managing human-friendly names versus machine-friendly numbers on a massive scale. 

##  2. Walk through exactly what happens when you type google.com in your browser (step by step, at least 6 steps)
1. URL Parsing and HSTS Check
2. DNS Lookup
3. TCP 3-way handshake
4. TLS/SSL Handshake (Secure Connection)
5. HTTP Request
6. Load Balancer and Server Processing:
7. HTTP Response
8. Browser Rendering

## 3. What is the difference between these DNS records:
A record
CNAME record
MX record
TXT record

A Record: Maps a hostname (domain) directly to an IPv4 address.
Example: google.com -> 142.250.190.46

CNAME Record: Points a subdomain to another domain (alias) rather than an IP.
Example: www.google.com -> google.com

MX Record: Determines where emails sent to the domain should be delivered. They often include a priority number to designate primary and backup mail servers.

TXT Record:  Stores human-readable or machine-readable text in the DNS, commonly used for SPF (Sender Policy Framework) to prevent email spoofing, domain ownership verification, or security keys (DKIM).  

## 4. What is a DNS resolver?
DNS resolver is a server that acts as an intermediary between a user's device and the Domain Name System. It translates human-readable domain names (e.g., example.com) into machine-readable IP addresses (e.g., 93.184.216.34) by querying various DNS servers. 

## 5. What is DNS caching? Why does it exist?
DNS caching is the process of temporarily storing Domain Name System (DNS) query results—specifically the IP addresses associated with domain names—within an operating system, web browser, or recursive resolver

## 6. What is TTL in DNS?
In DNS, Time to Live (TTL) is a numerical value (measured in seconds) set on records that dictates how long recursive resolvers and local devices (like browsers) cache DNS information before asking for an update.