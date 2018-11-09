# YOLO!
yolo() {
    # Filter some YOLO! keywords, pass the other arguments on directly
    case "$1" in
      "sup" )
        shift
        git status "$@"
        ;;
      "shove" )
        shift
        git push "$@"
        ;;
      "yank" )
        shift
        git pull "$@"
        ;;
      "snarf" )
        shift
        git fetch "$@"
        ;;
      "huh" )
        shift
        git diff "$@"
        ;;
      "wtf" )
        shift
        git difftool "$@"
        ;;
      "fuck" )
        shift
        git reset "$@"
        ;;
      "dude" )
        shift
        git checkout "$@"
        ;;
      "swag" )
        shift
        git tag "$@"
        ;;

      # Everything else goes to git directly
      *)
        git "$@"
        ;;
    esac
}
