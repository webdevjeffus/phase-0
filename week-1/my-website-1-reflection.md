 Website Reflections - Week 1
by Jeff George for Dev Bootcamp Phase 0
September 10, 2015

### Paste a link to your [USERNAME].github.io repository.

http://webdevjeffus.github.io/


### Explain how to create a repository on GitHub and clone the repository to your local computer to a non-technical person.

*Note: I'm assuming this hypothetical "non-technical person" has an account on GitHub, has git installed on his computer, and knows how to use the terminal. Doesn't everyone?*

1. Go to your profile page on GitHub. Click the **Create New ( + )** dropdown menu at the top right of the page, and click **New Repository**"
2. On the New Repo page, enter the following information:
  - **Repository name** (needs to be both short and descriptive)
  - **Description** (Keep it to 50 characters)
  - Click the **Public** radio button
  - Check the checkbox to include a **README** file
  - Choose a **License** from the dropdown menu (for DBC projects, choose the MIT license)
3. Click **Create Repository**. GitHub will create the repo and navigate to its page automatically.
4. At the lower right-hand corner of the repo page, click **Copy to Clipboard** to copy the URL for the new remote repo on GitHub.
5. Open your terminal. Navigate to the directory you intend to be the *parent directory* for the new local repo.
6. Enter: **git clone [PASTE_URL_FROM_CLIPBOARD]**
7. From the parent directory, enter **ls** to be sure the new repo is present.
8. If the repo is there, enter **cd [REPO-NAME]** to move to the repo directory.
9. In the repo directory, the branch name ("master" to begin with) should appear inside brackets ( **[ ]** ) as the final information in the terminal prompt. That's how you know you're working inside a git repository.


### Describe what open source means.

"Open Source" refers to intellectual property (software, text, images, etc.) that creators have licensed for use by others for free and without specific permission, so long as the terms of the license are observed. Several open source licenses are in wide use today (GNU, MIT, Creative Commons, Apache), and they vary slightly in the permissions they carry. Many of the most widely-used software development resources, including libraries, tools, frameworks, and programming languages, are open-source projects, maintained, expanded and improved by volunteer developers for the use of the entire development community.


### What do you think about Open Source? Does it make you nervous or protective? Does it feel like utopia?

The existence of high-quality, modern, well-maintained open source resources for software development has allowed developers to retain a great deal of control and influence over the development industry. The alternative - software owned, controlled, and sold by private, for-profit corporations - would leave developers subject to the will of those corporations for training, tools, and employment, and leave developers in a very bad bargaining position for each.

Whether through brilliant foresight, or happy accident, the rise of open-source development tools which developers can then use to create proprietary content for clients and employers for compensation, has strengthened the position of developers to influence and lead the direction of technology. Those same tools, under private control, would limit overall technological advancement and economic growth of the industry. Essentially, the willingness of a huge pool of talented developers to create and maintain top-quality tools and share them with the world is the foundation of the digital world as we know it today. By allowing the world to use their work freely, open-source developers have let the whole pie that is software development grow much, much larger than it would have otherwise. Because of this, though no one controls the whole pie (or even a sizable minority of it), everyone's piece of the pie is bigger.

Has open source created development utopia? Not exactly -- open source is democratic to the point of anarchic in many cases. Good tools get created, but many aren't well-maintained and may eventually be abandoned (PyGame, I'm looking at you...). Splinter versions fork off from original projects, potentially diluting or dividing the user and developer community (how many versions of Linux do we *really* need?). Widely-used tools may be subject to the whims of eccentric creators. Lots can go wrong...but lots can go right, too. Open source as a whole is amorphic, spontaneous, adaptive, resilient; individual elements -- often quite good ones -- may wither and die from neglect or mismanagement, but the community as a whole, and the tools it creates, survives, grows, and controls our future - distributively!


### Assess the importance of using licenses.

By default, all intellectual products are the property of their creator (whether an individual or an organization), who holds exclusive rights to copy, distribute, and profit from those works (collectively, the copyright). A license allows copyright holders to maintain their ownership, while allowing other entities to use their work in a controlled and approved manner.

The holder of a copyright to a work may choose not to allow anyone else to use or distribute it in any way, or she may choose to grant specific permission (license) to other individuals to use it in specific ways. This allows the copyright holder to set terms and demand compensation for the license, but it also takes time and resources for the copyright holder to negotiate and monitor each license. This is the way that entertainment and publishing corporations (eg: Walt Disney, McGraw-Hill, World Wide Pants) typically operate -- the sell a license to another company (Hasbro) to use their intellectual property (Otis the Snowman) for a specific purpose (talking doll) in return for payment (royalty).

In an open source context, licenses relieve copyright holders of the burden of negotiating and monitoring licensed usage of their works, but also make it almost impossible for them to benefit directly from those works in a financial way. For example, much (all?) of the code that runs Khanacademy.org is open-source and available on GitHub under an MIT license. Other entities could use all or part of this code to set up competing web services, and Khanacademy couldn't stop them, or force them to pay for that usage. However, as a well-respected not-for-profit foundation, Khanacademy.org receives funding from a variety of sources, and is able to pay a certain number of key personnel a competitive salary. (I very much doubt that Sal Khan is starving, unless he is choosing to do so! I certainly hope he's not, in any case.)


### What concepts were solidified in the challenge? Did you have any "aha" moments? What did you struggle with?

I realize the title of this challenge is "Your Website," but the work in it is really more git/GitHub practice, and darned good thing! While repeating the steps to create and clone a repo for the first question, I accidentally created a totally empty repo (by forgetting to include a license and readme), which led to an unexpected repo-setup page with slightly different next-steps for cloning the repo to my local system. I inadvertently turned the directory I use as the parent for all my DBC Phase 0 repos (Users/webdevjeff15/DBC-ph0) into the local version of the repo itself -- which put my existing repos *inside* this new, messed-up repo!

I had to figure out how to undo this mess, and in so doing, learned out to surgically remove the .git directory that turned the parent directory into a repo -- which required listing directory contents with the **-a** flag that shows *all* contents, including files and directories that start with a dot. Once I found the .git subdirectory, I had to navigate down that tree to remove all the subdirectories and their contents carefully, without disturbing the repos I wanted to keep (like **phase-0**).

This was a bit nerve-wracking, as I didn't want to lose or damage all of my work up to this point. I realized that if I did totally bork the local repos, I could delete them (I learned how to do that, too) and clone them down from GitHub again, but I didn't want to have to go through that process. The big moment - which was more of a "Whew!" than an "Aha!" - was when I saw the DBC-ph0 prompt appear in the terminal *without* a branch name. That's when I knew things were back to normal.


### Did you find any resources on your own that helped you better understand a topic? If so, please list it.

When googling for guidance on how to find and delete branches and repos, I found Macandropedia (http://makandracards.com/makandra), which offers very concise instructions for accomplishing small web development tasks in a format it calls "cards" -- basically, it explains what to do in no more space than a 3x5 index card. For example, when I needed to know how to delete a branch in a git repo, searching Makandropedia for "git delete branch" gave me a card that showed me the syntax for using the **-d** flag with **git branch** to delete a local branch. That was exactly what I needed, when I needed it.
