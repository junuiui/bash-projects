# Linux Bash Automation Roadmap

## [Level 1] System Monitor & Alert
Focuses on monitoring critical system resources and generating automated reports or alerts based on predefined thresholds.
*   **Key Tools:** `df`, `ps`, `top`, `awk`, `if/else` logic.
*   **Core Features:**
    *   Monitor Disk Usage (%) and compare against a threshold (e.g., 80%).
    *   Extract top 5 CPU/Memory consuming processes using `ps` or `top` (Batch mode) when thresholds are exceeded.
    *   Log all activities with timestamps to a local log file.
    *   Automate execution using `crontab`.

## [Level 2] Log Analyzer
Analyzes large-scale service logs to extract meaningful operational metrics and identify anomalies.
*   **Key Tools:** `grep`, `sed`, `awk`, `sort`, `uniq`, `find`.
*   **Core Features:**
    *   Parse `access.log` to count HTTP status codes (e.g., 200, 404, 500).
    *   Identify the top 10 most frequent visitor IP addresses.
    *   Detect specific error keywords in real-time and filter out unnecessary noise using `sed`.
    *   Generate a summary report in text or CSV format.

## [Level 3] Remote Backup Manager
Manages data integrity by compressing critical files and synchronizing them with remote storage or backup servers.
*   **Key Tools:** `tar`, `ssh`, `scp`, `rsync`, `find`.
*   **Core Features:**
    *   Compress target directories using `tar` with date-stamped filenames.
    *   Securely transfer backups to a remote server using SSH keys (`-i` option).
    *   Implement a Retention Policy: Automatically delete backups older than 7 days using the `find` command.
    *   Implement "Resume" logic for large file transfers using `wget -c` or `rsync`.

## [Level 4] DevOps Deployment Tool
Automates the End-to-End (E2E) workflow from code updates to service deployment, simulating a CI/CD pipeline.
*   **Key Tools:** `git`, `docker`, `environment variables`, `curl`.
*   **Core Features:**
    *   Pull the latest code from a Git repository.
    *   Automate Docker builds and container restarts upon code changes.
    *   Manage sensitive data (API keys, DB credentials) using environment variables.
    *   Implement basic health checks post-deployment using `curl` and execute rollbacks if the service is unreachable.