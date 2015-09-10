# Git Workflow Cheatsheet
### Created by Jeff George
### For Dev Bootcamp, Phase 0

## Create a Feature Branch for the current work session

1. Navigate to the local master branch on the local system.
2. Check **git status** to be sure you have no outstanding changes from previous work sessions, followed by a **git pull**, to verify that the lcoal master branch is up to date with the main repo on GitHub.
3. Create a branch for the current work session with the following command:
**git checkout -b <WORKING-BRANCH-NAME>**
This branch will be deleted after its changes have been committed and merged to the main repo, so its name isn't going to be used past the current session; keep the name short and easy-to-type, and don't worry about reusing a previous name. With the **-b** flag, the **checkout** command will both create the new branch, and transfer the user prompt to that new branch.

## Do whatever work is necessary for this work session

This will likely include both changes to existing files, and the addition of new files. Both sorts of changes will ultimately need to be merged and committed to the main repo on GitHub.

## Add files to be committed

After a reasonable amount of work has been done (and everyone's definition of "reasonable" will be different), you should prepare the changes to be committed and merged into the main repo.
1. From the working branch, type **git status** to check for the current state of any changed files. Git list changed files as either "to be committed", or "not staged for commit". Any new files will almost certainly be "not staged" the first time you do **git status**.
2. **Add** any changed files listed as "not staged" using the **git add** command:
**git add <FILENAME>** (Wildcards may be used to **add** multiple files in a single command.)
3. Once all unstaged files have been **add**ed, enter **git status** again to be sure you haven't missed any files. All files to be committed should appear on the "to be committed" list. If any files have been missed, **add** them now.

## Commit changes in Feature Branch and push them to Origin Branch

1. Use this command to commit all staged changes:
**git commit -m "<COMMIT-MSG-TEXT>"**
2. Use **git status** to confirm that all necessary files were included in the **commit**. (Files deliberately untracked will remain so, and will not be committed or merged.)
3. Push the committed changes to the origin branch:
**git push origin <WORKING-BRANCH-NAME>**