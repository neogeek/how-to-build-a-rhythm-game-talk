# How to Build a Rhythm Game Talk

## Converting Slides (pdf) to Images (png)

First install dependencies (macOS).

```bash
brew install imagemagick
brew install ghostscript
```

Then run `magick` with the following options:

```bash
magick -density 200 How\ to\ Build\ a\ Rhythm\ Game\ in\ \(Almost\)\ Any\ Game\ Engine.pdf  -quality 100 -crop 100%x100%-0-1 +repage -scene 1 slide.jpg
```
