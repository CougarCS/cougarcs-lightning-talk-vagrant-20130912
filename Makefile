slides.html: slides.md
	pandoc --self-contained -t s5 -s slides.md -o slides.html
