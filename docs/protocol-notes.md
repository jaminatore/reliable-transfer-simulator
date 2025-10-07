# Reliable Data Transfer (RDT 3.0) Protocol Notes

## Overview

This project implements RDT 3.0 handling packet loss, corruption, reordering through checksum verification, sequence numbering, acknowledgments, and retransmissions.

---

## Sender Logic

1. Read the input file (e.g., `declaration.txt`) and divide it into packets of fixed size (e.g., 200 bytes).
2. For each packet:
   - Compute a checksum over the payload and sequence number.
   - Send the packet.
   - Start a timer and wait for an acknowledgment (ACK).
3. On timeout or if an incorrect/corrupted ACK is received:
   - Retransmit the same packet.
4. Alternate the sequence number (`0` → `1` → `0` → ...).
5. When the file ends and the final ACK is received, close the connection.

---

## Receiver Logic

1. Wait for a packet from the sender.
2. Verify the packet’s checksum:
   - If valid and sequence number matches the expected value:
     - Deliver the payload to the file buffer.
     - Send an ACK for that sequence number.
     - Flip the expected sequence number.
   - If corrupted or out-of-order:
     - Discard the packet and resend the previous ACK.
3. Terminate cleanly when the sender closes or no packets are received after timeout.

---
