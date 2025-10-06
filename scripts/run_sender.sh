# ------------------------------------------------------------
# Reliable Transfer Simulator - Sender launcher
# Usage:
#   ./scripts/run_sender.sh [connection_id] [loss_rate] [corrupt_rate] [max_delay] [timeout]
# Example:
#   ./scripts/run_sender.sh 4321 0.2 0.1 5 60
# ------------------------------------------------------------
# Default values (used if you don't provide arguments):
#   connection_id = 1234
#   loss_rate     = 0.1
#   corrupt_rate  = 0.1
#   max_delay     = 1
#   timeout       = 1
# ------------------------------------------------------------

cd "$(dirname "$0")/.."
python3 src/sender.py "${1:-9231}" "${2:-0.1}" "${3:-0.1}" "${4:-1}" "${5:-1}"