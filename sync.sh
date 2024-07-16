git add .
timestamp=$(date +"%Y-%m-%d %H:%M:%S")
git commit -m "Auto-sync at $timestamp"
git push
