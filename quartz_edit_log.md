# Quartz Edit Log

## Blazed auto scroll carousel
**Edits**
modified:
    content/About.md # added section div blaze-slider
    package-lock.json # npm i blaze-slider # ie install package 
    package.json # same as above
    quartz/components/Body.tsx
     - added `import blazeScript from "./scripts/blaze-init.inline"`
     - added `Body.afterDOMLoaded = blazeScript;`
    quartz/styles/custom.scss # copied and pasted css from https://blaze-slider.dev/docs/installation
added:
    quartz/components/scripts/blaze-init.inline.ts # instructions from https://blaze-slider.dev/docs `Using the library via an NPM module` and `Initialize Slider` and `Provide Config`


## OverlayExplorer component (not yet succesful)

SpikeSpiegel — 09/14/2024 3:26 PM
Hey y'all, I wrote a new layout component for a pop-out explorer menu - suitable for providing an explorer on smaller viewports!! Video shows it in action on my phone.

You can look at the code at https://github.com/MikeKneeB/quartz-site/tree/main/extra/components (although it probably won't be a simple c&p drop in because of my docker/compose setup - but it shouldn't be too hard to modify it to fit in your projects as well if you want it).

It's based extensively off the existing Explorer & Search components (and makes use of some of the existing Explorer code where possible). TS/JS isn't my most comfortable language, so possibly some mistakes in there - but it seems to all be working as expected!
GitHub
quartz-site/extra/components at main · MikeKneeB/quartz-site
Contribute to MikeKneeB/quartz-site development by creating an account on GitHub.

**Edits:**
modified:
    quartz/components/index.ts
    quartz/util/lang.ts
added:
    quartz/components/OverlayExplorer.tsx
    quartz/components/scripts/overlayexplorer.inline.ts
    quartz/components/styles/overlayexplorer.scss
