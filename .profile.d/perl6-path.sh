local filename="$0"
debug_filename
local p6path="$HOME/perl6"
local p6_path_array=( "${p6path}/bin" "${p6path}/share/perl6/site/bin" )
add_array_to_path p6_path_array
export PATH

#PERL6_DIR="$HOME/.rakudobrew/moar-blead-nom/install/share/perl6/site/bin"
#export PATH="$PATH:/home/samantha/git/rakudo/install/bin:/home/samantha/git/rakudo/install/share/perl6/site/bin"
#export perl6='/home/samantha/git/rakudo/install/bin/perl6'
#if [ -f ~/.rakudobrew/bin/rakudobrew ]; then
#	eval "$(/home/samantha/.rakudobrew/bin/rakudobrew init -)"
#fi
# Function to easily update zprezto
function zprezto-update2 {
    function zprezto-update {
        local OWD="$(pwd)"
        cd -- "${ZPREZTODIR}"
        local orig_branch="$(git symbolic-ref HEAD 2>/dev/null | cut -d '/' -f 3)"
        if [[ "$orig_branch" == "master" ]]; then
            git fetch
            if [[ "$(git status -uno | grep behind)" ]]; then
                printf "There is an update availible. Trying to pull"
                if git pull --ff-only; then
                    printf "Syncing submodules\n"
                    git submodule update --recursive
                else
                    printf "Unable to fast-forward the changes. You can fix this by running 'cd %s' and then 'git pull' to manually pull and possibly merge in changes\n"
                fi
            else
                printf "There are no updates.\n"
            fi
        else
            printf "zprezto install at '%s' is not on the master branch (you're on '%s') Unable to automatically update.\n" "${ZPREZTODIR}" "${orig_branch}"
        fi
        cd -- "${OWD}"
    }
    #make_backup="$1"
    if [[ "$make_backup" ]]; then    
        local backup_branch="backup-$(date --iso-8601=seconds)"
        echo "Creating backup git branch ${backup_branch}"
        echo "original branch ${orig_branch}"
        git branch "$backup_branch"
        git checkout "$backup_branch"
        git add -u
        echo "Commiting changed files if any"
        git -c user.name='zprezto-update-saver' -c user.email 'zprezto@zprezto' commit --no-sign -m "Save changes"
        
            echo "Commiting changed files if any"
            #git -c user.name='zprezto-update-saver' -c user.email 'zprezto@zprezto' commit --no-sign -m "Save changes"
            #git checkout master
            #git fetch
            #git g
    fi

    cd -- "${OWD}"
}