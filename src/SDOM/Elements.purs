module SDOM.Elements where

import SDOM

import Data.Either (Either)
import Data.Incremental (Change)

a
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
a = element "a"

a_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
a_ = element_ "a"

abbr
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
abbr = element "abbr"

abbr_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
abbr_ = element_ "abbr"

acronym
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
acronym = element "acronym"

acronym_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
acronym_ = element_ "acronym"

address
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
address = element "address"

address_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
address_ = element_ "address"

applet
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
applet = element "applet"

applet_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
applet_ = element_ "applet"

area
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
area = element "area"

area_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
area_ = element_ "area"

article
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
article = element "article"

article_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
article_ = element_ "article"

aside
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
aside = element "aside"

aside_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
aside_ = element_ "aside"

audio
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
audio = element "audio"

audio_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
audio_ = element_ "audio"

b
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
b = element "b"

b_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
b_ = element_ "b"

base
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
base = element "base"

base_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
base_ = element_ "base"

basefont
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
basefont = element "basefont"

basefont_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
basefont_ = element_ "basefont"

bdi
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
bdi = element "bdi"

bdi_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
bdi_ = element_ "bdi"

bdo
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
bdo = element "bdo"

bdo_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
bdo_ = element_ "bdo"

big
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
big = element "big"

big_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
big_ = element_ "big"

blockquote
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
blockquote = element "blockquote"

blockquote_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
blockquote_ = element_ "blockquote"

body
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
body = element "body"

body_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
body_ = element_ "body"

br
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
br = element "br"

br_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
br_ = element_ "br"

button
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
button = element "button"

button_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
button_ = element_ "button"

canvas
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
canvas = element "canvas"

canvas_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
canvas_ = element_ "canvas"

caption
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
caption = element "caption"

caption_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
caption_ = element_ "caption"

center
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
center = element "center"

center_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
center_ = element_ "center"

cite
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
cite = element "cite"

cite_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
cite_ = element_ "cite"

code
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
code = element "code"

code_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
code_ = element_ "code"

col
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
col = element "col"

col_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
col_ = element_ "col"

colgroup
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
colgroup = element "colgroup"

colgroup_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
colgroup_ = element_ "colgroup"

datalist
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
datalist = element "datalist"

datalist_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
datalist_ = element_ "datalist"

dd
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
dd = element "dd"

dd_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
dd_ = element_ "dd"

del
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
del = element "del"

del_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
del_ = element_ "del"

details
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
details = element "details"

details_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
details_ = element_ "details"

dfn
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
dfn = element "dfn"

dfn_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
dfn_ = element_ "dfn"

dialog
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
dialog = element "dialog"

dialog_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
dialog_ = element_ "dialog"

dir
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
dir = element "dir"

dir_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
dir_ = element_ "dir"

div
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
div = element "div"

div_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
div_ = element_ "div"

dl
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
dl = element "dl"

dl_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
dl_ = element_ "dl"

dt
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
dt = element "dt"

dt_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
dt_ = element_ "dt"

em
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
em = element "em"

em_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
em_ = element_ "em"

embed
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
embed = element "embed"

embed_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
embed_ = element_ "embed"

fieldset
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
fieldset = element "fieldset"

fieldset_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
fieldset_ = element_ "fieldset"

figcaption
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
figcaption = element "figcaption"

figcaption_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
figcaption_ = element_ "figcaption"

figure
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
figure = element "figure"

figure_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
figure_ = element_ "figure"

font
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
font = element "font"

font_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
font_ = element_ "font"

footer
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
footer = element "footer"

footer_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
footer_ = element_ "footer"

form
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
form = element "form"

form_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
form_ = element_ "form"

frame
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
frame = element "frame"

frame_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
frame_ = element_ "frame"

frameset
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
frameset = element "frameset"

frameset_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
frameset_ = element_ "frameset"

h1
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
h1 = element "h1"

h1_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
h1_ = element_ "h1"

head
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
head = element "head"

head_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
head_ = element_ "head"

header
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
header = element "header"

header_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
header_ = element_ "header"

hr
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
hr = element "hr"

hr_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
hr_ = element_ "hr"

html
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
html = element "html"

html_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
html_ = element_ "htmch"

i
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
i = element "i"

i_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
i_ = element_ "i"

iframe
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
iframe = element "iframe"

iframe_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
iframe_ = element_ "iframe"

img
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
img = element "img"

img_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
img_ = element_ "img"

input
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
input = element "input"

input_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
input_ = element_ "input"

ins
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
ins = element "ins"

ins_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
ins_ = element_ "ins"

kbd
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
kbd = element "kbd"

kbd_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
kbd_ = element_ "kbd"

label
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
label = element "label"

label_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
label_ = element_ "label"

legend
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
legend = element "legend"

legend_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
legend_ = element_ "legend"

li
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
li = element "li"

li_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
li_ = element_ "li"

link
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
link = element "link"

link_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
link_ = element_ "link"

main
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
main = element "main"

main_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
main_ = element_ "main"

map
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
map = element "map"

map_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
map_ = element_ "map"

mark
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
mark = element "mark"

mark_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
mark_ = element_ "mark"

menu
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
menu = element "menu"

menu_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
menu_ = element_ "menu"

menuitem
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
menuitem = element "menuitem"

menuitem_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
menuitem_ = element_ "menuitem"

meta
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
meta = element "meta"

meta_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
meta_ = element_ "meta"

meter
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
meter = element "meter"

meter_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
meter_ = element_ "meter"

nav
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
nav = element "nav"

nav_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
nav_ = element_ "nav"

noframes
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
noframes = element "noframes"

noframes_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
noframes_ = element_ "noframes"

noscript
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
noscript = element "noscript"

noscript_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
noscript_ = element_ "noscript"

object
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
object = element "object"

object_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
object_ = element_ "object"

ol
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
ol = element "ol"

ol_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
ol_ = element_ "ol"

optgroup
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
optgroup = element "optgroup"

optgroup_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
optgroup_ = element_ "optgroup"

option
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
option = element "option"

option_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
option_ = element_ "option"

output
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
output = element "output"

output_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
output_ = element_ "outpuch"

p
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
p = element "p"

p_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
p_ = element_ "p"

param
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
param = element "param"

param_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
param_ = element_ "param"

picture
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
picture = element "picture"

picture_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
picture_ = element_ "picture"

pre
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
pre = element "pre"

pre_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
pre_ = element_ "pre"

progress
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
progress = element "progress"

progress_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
progress_ = element_ "progresch"

q
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
q = element "q"

q_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
q_ = element_ "q"

rp
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
rp = element "rp"

rp_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
rp_ = element_ "rp"

rt
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
rt = element "rt"

rt_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
rt_ = element_ "rt"

ruby
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
ruby = element "ruby"

ruby_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
ruby_ = element_ "rubch"

s
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
s = element "s"

s_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
s_ = element_ "s"

samp
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
samp = element "samp"

samp_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
samp_ = element_ "samp"

script
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
script = element "script"

script_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
script_ = element_ "script"

section
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
section = element "section"

section_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
section_ = element_ "section"

select
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
select = element "select"

select_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
select_ = element_ "select"

small
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
small = element "small"

small_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
small_ = element_ "small"

source
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
source = element "source"

source_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
source_ = element_ "source"

span
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
span = element "span"

span_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
span_ = element_ "span"

strike
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
strike = element "strike"

strike_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
strike_ = element_ "strike"

strong
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
strong = element "strong"

strong_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
strong_ = element_ "strong"

style
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
style = element "style"

style_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
style_ = element_ "style"

sub
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
sub = element "sub"

sub_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
sub_ = element_ "sub"

summary
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
summary = element "summary"

summary_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
summary_ = element_ "summary"

sup
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
sup = element "sup"

sup_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
sup_ = element_ "sup"

table
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
table = element "table"

table_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
table_ = element_ "table"

tbody
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
tbody = element "tbody"

tbody_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
tbody_ = element_ "tbody"

td
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
td = element "td"

td_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
td_ = element_ "td"

template
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
template = element "template"

template_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
template_ = element_ "template"

textarea
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
textarea = element "textarea"

textarea_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
textarea_ = element_ "textarea"

tfoot
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
tfoot = element "tfoot"

tfoot_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
tfoot_ = element_ "tfoot"

th
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
th = element "th"

th_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
th_ = element_ "th"

thead
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
thead = element "thead"

thead_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
thead_ = element_ "thead"

time
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
time = element "time"

time_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
time_ = element_ "time"

title
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
title = element "title"

title_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
title_ = element_ "title"

tr
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
tr = element "tr"

tr_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
tr_ = element_ "tr"

track
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
track = element "track"

track_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
track_ = element_ "track"

tt
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
tt = element "tt"

tt_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
tt_ = element_ "tch"

u
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
u = element "u"

u_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
u_ = element_ "u"

ul
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
ul = element "ul"

ul_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
ul_ = element_ "ul"

var
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
var = element "var"

var_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
var_ = element_ "var"

video
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
video = element "video"

video_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
video_ = element_ "video"

wbr
  :: forall channel context model
   . Array (Attr context model)
  -> Array (Handler context (Either channel (Change model)))
  -> Array (SDOM channel context model)
  -> SDOM channel context model
wbr = element "wbr"

wbr_
  :: forall channel context model
   . Array (SDOM channel context model)
  -> SDOM channel context model
wbr_ = element_ "wbr"
