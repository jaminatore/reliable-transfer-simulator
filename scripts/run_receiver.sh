# ------------------------------------------------------------
# Reliable Transfer Simulator - Receiver launcher
# Usage:
#   ./scripts/run_receiver.sh [connection_id] [loss_rate] [corrupt_rate] [max_delay]
# Example:
#   ./scripts/run_receiver.sh 4321 0.2 0.1 5
# ------------------------------------------------------------
# Default values (used if you don't provide arguments):
#   connection_id = 9231
#   loss_rate     = 0.1
#   corrupt_rate  = 0.1
#   max_delay     = 1
# ------------------------------------------------------------

cd "$(dirname "$0")/.."
python3 src/receiver.py "${1:-9231}" "${2:-0.1}" "${3:-0.1}" "${4:-1}"