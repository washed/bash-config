# find out where clang-format is
exe=$(which clang-format)

if [ -n "$exe" ]
then
  find \( \( -name '*.cpp' -or -name '*.hpp' -or -name '*.c' -or -name '*.h' \) -not \( -path '*build-*' -prune \) \) -exec clang-format -i -style=file {} \;
  find \( -name '*.TMP' \) -delete;
else
  echo "WARNING: clang-format was not found, cannot format files!"

fi

