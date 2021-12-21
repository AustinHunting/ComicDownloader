# downloading comics (WIP)

end goal: 
`./download-comics https://readcomiconline.li/Comic/The-Sandman-The-Dream-Hunters`

returns:
CBZ or CBR of all the comics on the page 

readcomics doesn't like when an auto scraper hits the site, so far only chrome save page option works 


## steps of action so far, 
wget page for all the books 

`wget https://readcomiconline.li/Comic/The-Sandman-The-Dream-Hunters`

from there we only want the items in the `<ul class="list">` section. more specifically `/Issue-.*"` then trim the last char add that to the main link.
can be done by 
`cat The-Sandman-The-Dream-Hunters.html | grep -o /Issue-.*\" | grep -o /Issue-.*[^\"]`

## links to images can be pulled from the list blogspot, they are not named anything good. will need to be renamed as they come in.


`wget -O "book-name" "link to book"`
sort through that page for blogspot 
set a counter for number of images 
wget each image and save it as an numbered output 

`cat "book-name" | grep -o "https://2.bp.blogspot.com.*\""`

## Here is some tmp code for the wget part
options:
 - (use a python captcha solver to download them?)
 - use a random timer before calls to make the comp think i'm human? 

```
### captcha kills this part, will need a rethink 
### adding wget code in here
# make a dir for the series 
# for book in $LINKS
# do
#     # prep and cleanup 
#     rm $FILENAME
#     mkdir -p $FILENAME
#     cd $FILENAME
#     for issue in $LINKS
#     do
#         ISSUE_NUMBER=$(echo $issue | grep -o Issue-[0-9]*)
#         mkdir -p $ISSUE_NUMBER
#         cd $ISSUE_NUMBER
#         wget -O "$ISSUE_NUMBER.html" $issue
#         count=0
#         for images in $(cat "$ISSUE_NUMBER.html" | grep -o "https://2.bp.blogspot.com.*\"")
#         do
#             wget -O "$count.jpg" $images
#             count=$((count + 1))
#         done
#         rename -e 's/\d+/sprintf("%02d",$&)/e' -- *.jpg
#         rm ./*.html
#         # do the cbz packing here 
#         cd ..
#     done
# done
```


