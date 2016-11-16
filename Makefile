# makefile for the Jekyll tutorials site
TUTORIAL_FOLDER = tutorials
GIT_PATH = https://github.com/earthlab/$(TUTORIAL_FOLDER).git

build:
		# Download Jupyter notebooks from GitHub
		rm -rf $(TUTORIAL_FOLDER)
		git clone $(GIT_PATH)
		
		# convert tutorials to markdown
		Rscript --vanilla processing-code/generate_posts.R

		# clean up
		rm -rf $(TUTORIAL_FOLDER)
