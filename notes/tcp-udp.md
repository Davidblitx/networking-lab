**Questions to answer:**

## 1. What is TCP? What problem does it solve?
TCP(Transmission Control Protocol) is a courier service that requires a signature for every package. It functions at the transport layer, breaking large messages into packets, ensuring they arrive in sequence, and retransmitting lost packets. 

The TCP solves the problem of lost packets, unreliable delivery unlike UDP, corrupted data, Network Congestion & Overwhelmed Receiver, Out-of-Order Packets.

## 2. What is UDP? What problem does it solve?
UDP(User Datagram Protocol), I think of it as a radio broadcast or a live football match.  It is designed for speed and efficiency, prioritizing the rapid delivery of data packets (called "datagrams") over reliability.

The UDP solves latency issues associated with connection-oriented protocols like TCP. In a video call, if one frame of video is lost, you don't want the whole call to "pause" while the computer asks for that one old frame. You want the most recent data now.

## What is the TCP 3-way handshake? (Draw it in ASCII art)
The TCP 3-way handshake is a process using SYN, SYN-ACK, and ACK packets to establish a reliable, connection-oriented session between a client and server before data transmission.
SYN (Synchronize): "Hey, I want to talk. Here is my starting number."

SYN-ACK (Synchronize-Acknowledge): "I hear you! I also want to talk. Here is my number, and I acknowledge yours."

ACK (Acknowledge): "Got it. We are now in sync. Let’s go."

[TCP 3-Way Handshake]

   Client                       Server
      |          (1) SYN           |
      |--------------------------->|  <-- "I want to connect!"
      |                            |
      |        (2) SYN-ACK         |
      |<---------------------------|  <-- "I'm here! I'm ready too."
      |                            |
      |          (3) ACK           |
      |--------------------------->|  <-- "Great, let's start sending data."
      |                            |
      |    Connection Established  |

## 4. Why does SSH use TCP but DNS often uses UDP?
SSH uses TCP because TCP provides reliability. Is about error correction and ordering.
When you type rm -rf / in an SSH terminal, you must ensure every single character arrives in the exact right order. If TCP doesn't get that "signature" (Acknowledgment), it resends the data. If SSH used UDP and your internet flickered, the server might only receive rm -rf /ho instead of /home, which would be a disaster. TCP ensures the stream is perfect.

DNS uses UDP because Speed is the priority for DNS. Most DNS queries are tiny (one packet in, one packet out). Using UDP avoids the "overhead" of the 3-way handshake. If a DNS packet is lost, your computer just asks again half a second later.

## 5. What does "stateful" mean in networking?
It refers to a system, protocol, or firewall that remembers the context of active connections and previous packets in a session, rather than treating each packet in isolation. 

## 6. Name 3 protocols that use TCP and 3 that use UDP
Protocols that uses TCP:
HTTP/HTTPS - Used for web browsing, requiring guaranteed, ordered packet delivery.
FTP - Used for reliable file transfers, ensuring data is not corrupted.
SMTP - Used for sending email, where data integrity is critical. 

Protocols that uses UDP:
DNS - Used for fast hostname resolution, prioritising speed over reliability.
DHCP - Used to assign IP addresses, where efficiency and low overhead are prioritized.
VoIP - Used for real-time voice and video communication, where low latency is more important than perfect reliability. 