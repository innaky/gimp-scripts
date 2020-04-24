(script-fu-register
 "script-fu-text-box"
 "Text Box"
 "Creates a simple text box, sized to fit\
around the user's choice of text, font, \
font size and color."
 "Michael Terry"
 "copyright 1997, Michael Terry;\
2009, the GIMP Documentation Team"
 "Octuber 27, 1997"
 ""
 SF-STRING "Texto" "Texto"
 SF-FONT "Fuente" "Fuente"
 SF-ADJUSTMENT "Tamaño de Fuente" '(100 1 1000 1 10 0 1)
 SF-COLOR "Color" '(5 41 41))

(script-fu-menu-register "script-fu-text-box" "<Image>/File/Create/Text")

(define (script-fu-text-box inText inFont inFontSize inTextColor)
  (let*
      ((theImageWidth 10)
       (theImageHeight 10)
       (theImage
	(car
	 (gimp-image-new theImageWidth theImageHeight RGB)))
       (theText)
       (theLayer
	(car
	 (gimp-layer-new
	  theImage theImageWidth theImageHeight RGB-IMAGE "layer 1"
	  80 LAYER-MODE-NORMAL-LEGACY))))
    (gimp-image-add-layer theImage theLayer 0)
    (gimp-context-set-background '(6 97 53))
    (gimp-context-set-foreground inTextColor)
    (gimp-drawable-fill theLayer FILL-BACKGROUND)
    (set! theText
	  (car
	   (gimp-text-fontname theImage theLayer
			       0 0
			       inText
			       0
			       TRUE
			       inFontSize PIXELS
			       "Sans")))
    (set! theImageWidth (car (gimp-drawable-width theText)))
    (set! theImageHeight (car (gimp-drawable-height theText)))
    (gimp-image-resize theImage theImageWidth theImageHeight 0 0)
    (gimp-layer-resize theLayer theImageWidth theImageHeight 0 0)
    (gimp-display-new theImage)))
