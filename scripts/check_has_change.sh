if [[ $(git status --porcelain) ]]; then
    echo "Please generate code and try again"
    exit 1
else
    echo "All code are generated"
fi
