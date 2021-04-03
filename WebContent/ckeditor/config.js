/**
 * @license Copyright (c) 2003-2021, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	config.toolbar = 'Full';
   
    config.toolbar_Full = [
		['Styles','Format','Font','FontSize','-','TextColor','BGColor'],
        ['Find','Replace'],
    	'/',
		['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
		['NumberedList','BulletedList','-','JustifyLeft','JustifyCenter','JustifyRight'],
		['Link','Unlink'],
		['Image','Table','HorizontalRule'],
        
    ];
};
