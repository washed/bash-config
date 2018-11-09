case $1 in
  nf)
    # Create new feature branch
    if [ "$2" = "" ]
    then
      echo "Error! Supply branchname as argument"
    else
      git checkout -b feature/$2 develop
    fi
    ;;
  mf)
    # Merge feature branch into develop
    if [ "$2" = "" ]
    then
      echo "Error! Supply branchname as argument"
    else
      git checkout develop
      git merge --no-ff feature/$2
      git branch -d feature/$2
      git push origin develop
    fi
    ;;
  nb)
    # Create new bugifx branch
    if [ "$2" = "" ]
    then
      echo "Error! Supply branchname as argument"
    else
      git checkout -b bugfix/$2 develop
    fi
    ;;
  mb)
    # Merge bugfix branch into develop
    if [ "$2" = "" ]
    then
      echo "Error! Supply branchname as argument"
    else
      git checkout develop
      git merge --no-ff bugfix/$2
      git branch -d bugfix/$2
      git push origin develop
    fi
    ;;
  nhf)
    # Create new hotfix branch
    if [ "$2" = "" ]
    then
      echo "Error! Supply branchname as argument"
    else
      git checkout -b hotfix/$2 master
    fi
    ;;
  init)
    # Init a new repository with a certain template
    if [ "$2" = "" ]
    then
      echo "Error: Supply template name as argument"
      echo "ADSP-2191, STM32F7, Qt"
    else

      mkdir git-temp
      cd git-temp
      git clone N:/Software/dev-support/git-template.git git-template
      cd git-template

      case $2 in
        ADSP-2191)
          git checkout ADSP-2191
          ;;
        STM32F7)
          echo "Template for STM32F7 not yet supported!"
          ;;
        Qt)
          git checkout Qt
          ;;
      esac

      cd ../..
      cp git-temp/git-template/.clang-format .clang-format
      cp git-temp/git-template/.gitignore .gitignore
      git init
      rm -r -f git-temp

    fi
    ;;
esac
