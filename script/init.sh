#!/usr/bin/env bash

msg() {
    echo -E "/* $1 */"
}

DOCU_PATH="/docusaurus"
WEB_SRC_PATH="$DOCU_PATH"/website

echo -e "Variables:
\\t- UID=${TARGET_UID}
\\t- GID=${TARGET_GID}
\\t- VERSION=${VERSION}
\\t- WEBSITE_NAME=${WEBSITE_NAME}
\\t- TEMPLATE=${TEMPLATE}"

[[ -z "$WEBSITE_NAME" ]] && \
    msg "You have to enter your website name. Program will be closed." && exit

#初始化安装docusaurus
if [[ ! -d "$DOCU_PATH"/"$WEBSITE_NAME" ]]; then
    msg "Install docusaurus..."
    npx create-docusaurus@"$VERSION" "$WEBSITE_NAME" "$TEMPLATE" &
    [[ "$!" -gt 0 ]] && wait $!
    ln -s "$DOCU_PATH"/"$WEBSITE_NAME" "$WEB_SRC_PATH"
    chown -R "$TARGET_UID":"$TARGET_GID" "$DOCU_PATH"
else
    chown -R "$TARGET_UID":"$TARGET_GID" "$DOCU_PATH"
    msg "Docusaurus configuration already exists in the target directory $DOCU_PATH"
fi

if [[ ! -d "$DOCU_PATH"/"$WEBSITE_NAME"/node_modules ]]; then
    msg "Installing node modules..."
    cd "$DOCU_PATH"/"$WEBSITE_NAME"
    yarn install &
    [[ "$!" -gt 0 ]] && wait $!
    cd ..
    ln -sf "$DOCU_PATH"/"$WEBSITE_NAME" "$WEB_SRC_PATH"
    chown -R "$TARGET_UID":"$TARGET_GID" "$DOCU_PATH"
else
    msg "Node modules already exist in $DOCU_PATH/$WEBSITE_NAME/node_modules"
fi

msg "Start supervisord to start Docusaurus..."
supervisord -c /etc/supervisor/conf.d/supervisord.conf