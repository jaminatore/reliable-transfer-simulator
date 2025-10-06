# Reliable Data Transfer (RDT 3.0) – Python Implementation

This project implements a Reliable Data Transfer (RDT 3.0) protocol in Python, following the classic stop-and-wait approach with alternating sequence numbers, checksum validation, and retransmission logic over a simulated unreliable channel.

It consists of two main programs:

- `src/sender.py` – sends data packets with checksums, sequence numbers, and retransmission on timeout.
- `src/receiver.py` – receives packets, validates checksums, acknowledges correct ones, and requests retransmission when errors occur.

---

## Features

- Stop-and-Wait RDT (Alternating Bit Protocol)
- Checksum generation and validation
- Retransmission on packet loss, corruption, or timeout
- Works over simulated unreliable channel (loss/corruption/delay)
- Parameterized sender/receiver for flexible testing

---

## Directory Structure

reliable-transfer-simulator/
├── src/
│ ├── sender.py
│ └── receiver.py
├── data/
│ └── declaration.txt
├── scripts/
│ ├── run_sender.sh
│ └── run_receiver.sh
├── docs/
│ ├── protocol-notes.md
│ └── screenshots/
├── README.md
└── .gitignore

---

## Running the Program

1. Open two terminals in the repository root.
2. Start the receiver in the first terminal.
3. Start the sender in the second terminal with the same connection ID.

### Start the Receiver (first terminal)
./scripts/run_receiver.sh [connection_id] [loss_rate] [corrupt_rate] [max_delay]

### Start the Sender (second terminal)
./scripts/run_sender.sh [connection_id] [loss_rate] [corrupt_rate] [max_delay] [timeout]

Both must use the same connection_id (integer 1000–9999).

---

## Example Runs

### Clean test run
Terminal 1
./scripts/run_receiver.sh 1234 0 0 0

Terminal 2
./scripts/run_sender.sh 1234 0 0 0 3

### Simulated unreliable network
Terminal 1
./scripts/run_receiver.sh 4321 0.2 0.1 5

Terminal 2
./scripts/run_sender.sh 4321 0.2 0.1 5 60

---

## Parameter Reference

| Parameter | Description | Example |
|------------|--------------|----------|
| connection_id | Numeric ID (1000–9999) used to pair sender and receiver | 1234 |
| loss_rate | Probability of packet loss | 0-1 |
| corrupt_rate | Probability of packet corruption | 0-1 |
| max_delay | Maximum simulated network delay (seconds) | 0-5 |
| timeout | Sender retransmission timeout (seconds) | 1-60 |

---

## Testing and Verification

| Test | Expected Result |
|------|-----------------|
| Clean run (0 0 0) | Fast transmission and identical checksums |
| Moderate loss (0.2 0.1 5) | Retransmissions visible; terminates correctly |
| Mismatched IDs | Receiver waits (no pairing) |
| Missing declaration.txt | Sender reports file not found |

At the end of transmission, both sender and receiver should print matching checksums, confirming complete and accurate file transfer.

---

## Design Notes

Implemented using RDT 3.0 principles:

1. Alternating bit sequence numbers (0 and 1)
2. Sender computes and appends checksum to each packet
3. Receiver validates checksum and expected sequence number
4. Receiver sends ACK or NAK based on packet integrity
5. Sender retransmits on timeout or incorrect ACK
6. Transmission completes after final ACK confirmation and EOF
   
---

## Requirements

- Python 3.8 or higher
- Works on macOS, Linux, or WSL
- No external packages required
