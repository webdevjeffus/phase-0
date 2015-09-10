# Git Workflow Walk-thru
#### Created by Jeff George for Dev Bootcamp, Phase 0

### Create a Feature Branch for the current work session

1. Navigate to the local master branch on the local system.
2. Check **git status** to be sure you have no outstanding changes from previous work sessions, followed by a **git pull**, to verify that the lcoal master branch is up to date with the main repo on GitHub.
3. Create a branch for the current work session with the following command:

**git checkout -b [WORKING-BRANCH-NAME]**

This branch will be deleted after its changes have been committed and merged to the main repo, so its name isn't going to be used past the current session; keep the name short and easy-to-type, and don't worry about reusing a previous name. With the **-b** flag, the **checkout** command will both create the new branch, and transfer the user prompt to that new branch.

### Do whatever work is necessary for this work session

This will likely include both changes to existing files, and the addition of new files. Both sorts of changes will ultimately need to be merged and committed to the main repo on GitHub.

### Add files to be committed

After a reasonable amount of work has been done (and everyone's definition of "reasonable" will be different), you should prepare the changes to be committed and merged to the remote repo on GitHub.

1. From the working branch, type **git status** to check for the current state of any changed files. Git list changed files as either "to be committed", or "not staged for commit". Any new files will almost certainly be "not staged" the first time you do **git status**.

2. **Add** any changed files listed as "not staged" using the **git add** command:

**git add [FILENAME]** (Wildcards may be used to **add** multiple files in a single command.)

3. Once all unstaged files have been **add**ed, use **git status** again to be sure you haven't missed any files. All files to be committed should appear on the "to be committed" list. If any files have been missed, **add** them now.

### Commit changes in Feature Branch and Push them to Remote Branch

1. Use this command to commit all staged changes:
**git commit -m "[COMMIT-MSG-TEXT]"**
2. Use **git status** to confirm that all necessary files were included in the **commit**. (Files deliberately untracked will remain so, and will not be committed or merged.)
3. Push the committed changes to the remote, origin branch:
**git push origin [WORKING-BRANCH-NAME]**
4. GitHub will likely ask for your GitHub Username and Password before allowing the **push** to go through; provide them when prompted.

### Merge the Feature and Remote Branches at GitHub

1. In Chrome, navigate to the web page for the repository at GitHub.
2. Click "Pull Requests" in the menu in the right-hand sidebar on the repo page to begin the **pull** process.
3. On the next page, click the "New Pull Requests" button.
4. On the next page, headed "Compare changes", you will have to specify which branches to compare. From the drop-down menus, choose "Base: **master**" and "Compare: **[WORKING-BRANCH-NAME]**".
5. Unless something has gone wrong, the comparison should produce an "Able to merge" message. You can scroll down the page to see the changes to files presented in windows.
6. Click "Create Pull Request".
7. The next page will describe the pull request, and be headed with the Commit message you included with the **git commit** command. Scroll down to find (if all has gone well) a message reading, "This branch is up to date with the base branch; Merging can be performed automatically." (If there are conflicts between the branches, you will be given instructions for resolving them at the command line.)
8. Click the "Merge Pull Request" button to initiate the pull request. You will be asked to confirm the request by clicking a button, "Confirm merge." Click it.
9. GitHub and git will perform the merge. After it is complete, you should get a message, "Pull request successfully merged and closed."
10. At this point, the Feature branch is no longer needed. You can clean up your GitHub repo by clicking the "Delete branch" button.
11. If you navigate back to the GitHub page for the repo, you will see that the changes you committed have been merged into the remote repo on GitHub.

### Update the local Master Branch to match the Remote Branch on GitHub

1. Back in the terminal, use **git checkout master** to navigate to the master branch. If you open the files there, you will find that the changes you made, committed, and merged to the GitHub repo have not appeared in the local master branch yet.
2. Update the local master with the command **git pull origin master**. (Alternately, you can perform separate **fetch** and **merge** steps in place of this **pull**.) The local master branch is now fully updated to match the remote repo at GitHub!

### Begin another work session (probably on another day!)
1. Begin over at the top of this walk-thru, with **git status** to be sure no one else on the team made changes since your last commit, merge, and pull.
2. Use **git pull** to be sure you're working with the very latest version.
3. Create another working branch with **git checkout -b [NEW-WORKING-BRANCH]**, and get to work!