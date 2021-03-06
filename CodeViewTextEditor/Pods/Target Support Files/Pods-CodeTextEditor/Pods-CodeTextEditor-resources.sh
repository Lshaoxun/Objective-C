#!/bin/sh
set -e

mkdir -p "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"

RESOURCES_TO_COPY=${PODS_ROOT}/resources-to-copy-${TARGETNAME}.txt
> "$RESOURCES_TO_COPY"

XCASSET_FILES=()

realpath() {
  DIRECTORY="$(cd "${1%/*}" && pwd)"
  FILENAME="${1##*/}"
  echo "$DIRECTORY/$FILENAME"
}

install_resource()
{
  case $1 in
    *.storyboard)
      echo "ibtool --reference-external-strings-file --errors --warnings --notices --output-format human-readable-text --compile ${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .storyboard`.storyboardc ${PODS_ROOT}/$1 --sdk ${SDKROOT}"
      ibtool --reference-external-strings-file --errors --warnings --notices --output-format human-readable-text --compile "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .storyboard`.storyboardc" "${PODS_ROOT}/$1" --sdk "${SDKROOT}"
      ;;
    *.xib)
      echo "ibtool --reference-external-strings-file --errors --warnings --notices --output-format human-readable-text --compile ${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .xib`.nib ${PODS_ROOT}/$1 --sdk ${SDKROOT}"
      ibtool --reference-external-strings-file --errors --warnings --notices --output-format human-readable-text --compile "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .xib`.nib" "${PODS_ROOT}/$1" --sdk "${SDKROOT}"
      ;;
    *.framework)
      echo "mkdir -p ${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      mkdir -p "${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      echo "rsync -av ${PODS_ROOT}/$1 ${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      rsync -av "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      ;;
    *.xcdatamodel)
      echo "xcrun momc \"${PODS_ROOT}/$1\" \"${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1"`.mom\""
      xcrun momc "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcdatamodel`.mom"
      ;;
    *.xcdatamodeld)
      echo "xcrun momc \"${PODS_ROOT}/$1\" \"${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcdatamodeld`.momd\""
      xcrun momc "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcdatamodeld`.momd"
      ;;
    *.xcmappingmodel)
      echo "xcrun mapc \"${PODS_ROOT}/$1\" \"${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcmappingmodel`.cdm\""
      xcrun mapc "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcmappingmodel`.cdm"
      ;;
    *.xcassets)
      ABSOLUTE_XCASSET_FILE=$(realpath "${PODS_ROOT}/$1")
      XCASSET_FILES+=("$ABSOLUTE_XCASSET_FILE")
      ;;
    /*)
      echo "$1"
      echo "$1" >> "$RESOURCES_TO_COPY"
      ;;
    *)
      echo "${PODS_ROOT}/$1"
      echo "${PODS_ROOT}/$1" >> "$RESOURCES_TO_COPY"
      ;;
  esac
}
if [[ "$CONFIGURATION" == "Debug" ]]; then
  install_resource "WEPopover/Resources/Popover/popoverArrowDown-white@2x.png"
  install_resource "WEPopover/Resources/Popover/popoverArrowDown.png"
  install_resource "WEPopover/Resources/Popover/popoverArrowDown@2x.png"
  install_resource "WEPopover/Resources/Popover/popoverArrowDownSimple.png"
  install_resource "WEPopover/Resources/Popover/popoverArrowLeft-white@2x.png"
  install_resource "WEPopover/Resources/Popover/popoverArrowLeft.png"
  install_resource "WEPopover/Resources/Popover/popoverArrowLeft@2x.png"
  install_resource "WEPopover/Resources/Popover/popoverArrowLeftSimple.png"
  install_resource "WEPopover/Resources/Popover/popoverArrowRight-white@2x.png"
  install_resource "WEPopover/Resources/Popover/popoverArrowRight.png"
  install_resource "WEPopover/Resources/Popover/popoverArrowRight@2x.png"
  install_resource "WEPopover/Resources/Popover/popoverArrowRightSimple.png"
  install_resource "WEPopover/Resources/Popover/popoverArrowUp-white@2x.png"
  install_resource "WEPopover/Resources/Popover/popoverArrowUp.png"
  install_resource "WEPopover/Resources/Popover/popoverArrowUp@2x.png"
  install_resource "WEPopover/Resources/Popover/popoverArrowUpSimple.png"
  install_resource "WEPopover/Resources/Popover/popoverBg-white@2x.png"
  install_resource "WEPopover/Resources/Popover/popoverBg.png"
  install_resource "WEPopover/Resources/Popover/popoverBg@2x.png"
  install_resource "WEPopover/Resources/Popover/popoverBgSimple.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/backcolor.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/bold.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/bold@2x.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/bullist.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/bullist@2x.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/buttons/button.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/buttons/buttoncenter.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/buttons/buttoncenterSelected.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/buttons/buttonleft.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/buttons/buttonleftSelected.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/buttons/buttonright.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/buttons/buttonrightSelected.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/buttons/buttonSelected.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/buttons/dropDownTriangle.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/buttons/dropDownTriangle@2x.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/code.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/colors.jpg"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/colorsOld.jpg"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/email.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/file.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/firstLineIndent.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/firstLineIndent@2x.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/forecolor.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/image.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/indent.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/indent@2x.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/italic.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/italic@2x.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/justifycenter.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/justifycenter@2x.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/justifyfull.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/justifyfull@2x.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/justifyleft.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/justifyleft@2x.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/justifyright.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/justifyright@2x.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/link.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/numlist.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/numlist@2x.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/outdent.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/outdent@2x.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/redo.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/removeformat.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/strikethrough.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/strikethrough@2x.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/underline.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/underline@2x.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/undo.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/unlink.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/buttons"
fi
if [[ "$CONFIGURATION" == "Release" ]]; then
  install_resource "WEPopover/Resources/Popover/popoverArrowDown-white@2x.png"
  install_resource "WEPopover/Resources/Popover/popoverArrowDown.png"
  install_resource "WEPopover/Resources/Popover/popoverArrowDown@2x.png"
  install_resource "WEPopover/Resources/Popover/popoverArrowDownSimple.png"
  install_resource "WEPopover/Resources/Popover/popoverArrowLeft-white@2x.png"
  install_resource "WEPopover/Resources/Popover/popoverArrowLeft.png"
  install_resource "WEPopover/Resources/Popover/popoverArrowLeft@2x.png"
  install_resource "WEPopover/Resources/Popover/popoverArrowLeftSimple.png"
  install_resource "WEPopover/Resources/Popover/popoverArrowRight-white@2x.png"
  install_resource "WEPopover/Resources/Popover/popoverArrowRight.png"
  install_resource "WEPopover/Resources/Popover/popoverArrowRight@2x.png"
  install_resource "WEPopover/Resources/Popover/popoverArrowRightSimple.png"
  install_resource "WEPopover/Resources/Popover/popoverArrowUp-white@2x.png"
  install_resource "WEPopover/Resources/Popover/popoverArrowUp.png"
  install_resource "WEPopover/Resources/Popover/popoverArrowUp@2x.png"
  install_resource "WEPopover/Resources/Popover/popoverArrowUpSimple.png"
  install_resource "WEPopover/Resources/Popover/popoverBg-white@2x.png"
  install_resource "WEPopover/Resources/Popover/popoverBg.png"
  install_resource "WEPopover/Resources/Popover/popoverBg@2x.png"
  install_resource "WEPopover/Resources/Popover/popoverBgSimple.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/backcolor.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/bold.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/bold@2x.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/bullist.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/bullist@2x.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/buttons/button.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/buttons/buttoncenter.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/buttons/buttoncenterSelected.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/buttons/buttonleft.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/buttons/buttonleftSelected.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/buttons/buttonright.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/buttons/buttonrightSelected.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/buttons/buttonSelected.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/buttons/dropDownTriangle.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/buttons/dropDownTriangle@2x.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/code.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/colors.jpg"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/colorsOld.jpg"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/email.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/file.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/firstLineIndent.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/firstLineIndent@2x.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/forecolor.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/image.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/indent.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/indent@2x.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/italic.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/italic@2x.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/justifycenter.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/justifycenter@2x.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/justifyfull.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/justifyfull@2x.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/justifyleft.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/justifyleft@2x.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/justifyright.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/justifyright@2x.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/link.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/numlist.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/numlist@2x.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/outdent.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/outdent@2x.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/redo.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/removeformat.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/strikethrough.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/strikethrough@2x.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/underline.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/underline@2x.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/undo.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/unlink.png"
  install_resource "iOS-Rich-Text-Editor/RichTextEditor/Source/Assets/buttons"
fi

mkdir -p "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
rsync -avr --copy-links --no-relative --exclude '*/.svn/*' --files-from="$RESOURCES_TO_COPY" / "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
if [[ "${ACTION}" == "install" ]] && [[ "${SKIP_INSTALL}" == "NO" ]]; then
  mkdir -p "${INSTALL_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
  rsync -avr --copy-links --no-relative --exclude '*/.svn/*' --files-from="$RESOURCES_TO_COPY" / "${INSTALL_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
fi
rm -f "$RESOURCES_TO_COPY"

if [[ -n "${WRAPPER_EXTENSION}" ]] && [ "`xcrun --find actool`" ] && [ -n "$XCASSET_FILES" ]
then
  case "${TARGETED_DEVICE_FAMILY}" in
    1,2)
      TARGET_DEVICE_ARGS="--target-device ipad --target-device iphone"
      ;;
    1)
      TARGET_DEVICE_ARGS="--target-device iphone"
      ;;
    2)
      TARGET_DEVICE_ARGS="--target-device ipad"
      ;;
    *)
      TARGET_DEVICE_ARGS="--target-device mac"
      ;;
  esac

  # Find all other xcassets (this unfortunately includes those of path pods and other targets).
  OTHER_XCASSETS=$(find "$PWD" -iname "*.xcassets" -type d)
  while read line; do
    if [[ $line != "`realpath $PODS_ROOT`*" ]]; then
      XCASSET_FILES+=("$line")
    fi
  done <<<"$OTHER_XCASSETS"

  printf "%s\0" "${XCASSET_FILES[@]}" | xargs -0 xcrun actool --output-format human-readable-text --notices --warnings --platform "${PLATFORM_NAME}" --minimum-deployment-target "${IPHONEOS_DEPLOYMENT_TARGET}" ${TARGET_DEVICE_ARGS} --compress-pngs --compile "${BUILT_PRODUCTS_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
fi
