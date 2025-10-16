<?php
/**
 * OLON Sentiment TV - WordPress Block Theme
 *
 * Theme Name: OLON Sentiment TV
 * Description: Sentiment-driven content powered by Supabase
 * Version: 1.0.0
 * Author: OLON Team
 * Text Domain: olon-sentiment-tv
 */

if (!defined('ABSPATH')) {
    exit;
}

/**
 * Enqueue theme assets
 */
function olon_enqueue_assets() {
    $theme_version = wp_get_theme()->get('Version');
    $theme_uri = get_template_directory_uri();

    // CSS - Load in dependency order
    wp_enqueue_style(
        'olon-variables',
        $theme_uri . '/assets/css/variables.css',
        array(),
        $theme_version
    );

    wp_enqueue_style(
        'olon-base',
        $theme_uri . '/assets/css/base.css',
        array('olon-variables'),
        $theme_version
    );

    wp_enqueue_style(
        'olon-components',
        $theme_uri . '/assets/css/components.css',
        array('olon-base'),
        $theme_version
    );

    wp_enqueue_style(
        'olon-aura',
        $theme_uri . '/assets/css/aura.css',
        array('olon-components'),
        $theme_version
    );

    wp_enqueue_style(
        'olon-style',
        get_stylesheet_uri(),
        array('olon-aura'),
        $theme_version
    );

    // Supabase JavaScript library from CDN
    wp_enqueue_script(
        'supabase-js',
        'https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2',
        array(),
        '2.0.0',
        true
    );

    // Theme JavaScript modules - Load in dependency order
    wp_enqueue_script(
        'olon-supabase-client',
        $theme_uri . '/assets/js/supabase-client.js',
        array('supabase-js'),
        $theme_version,
        true
    );

    wp_enqueue_script(
        'olon-aura',
        $theme_uri . '/assets/js/aura.js',
        array(),
        $theme_version,
        true
    );

    wp_enqueue_script(
        'olon-header-logo',
        $theme_uri . '/assets/js/header-logo.js',
        array(),
        $theme_version,
        true
    );

    wp_enqueue_script(
        'olon-categories',
        $theme_uri . '/assets/js/categories.js',
        array('olon-supabase-client', 'olon-aura', 'olon-header-logo'),
        $theme_version,
        true
    );

    wp_enqueue_script(
        'olon-posts',
        $theme_uri . '/assets/js/posts.js',
        array('olon-supabase-client'),
        $theme_version,
        true
    );

    wp_enqueue_script(
        'olon-main',
        $theme_uri . '/assets/js/main.js',
        array('olon-categories', 'olon-posts'),
        $theme_version,
        true
    );

    // Pass configuration to JavaScript
    wp_localize_script('olon-supabase-client', 'OLON_CONFIG', array(
        'supabaseUrl' => defined('SUPABASE_URL') ? SUPABASE_URL : '',
        'supabaseAnonKey' => defined('SUPABASE_ANON_KEY') ? SUPABASE_ANON_KEY : '',
        'themeUrl' => $theme_uri,
    ));
}
add_action('wp_enqueue_scripts', 'olon_enqueue_assets');

/**
 * Theme setup
 */
function olon_theme_setup() {
    // Add theme support
    add_theme_support('title-tag');
    add_theme_support('post-thumbnails');
    add_theme_support('editor-styles');
    add_theme_support('wp-block-styles');
    add_theme_support('align-wide');
    add_theme_support('responsive-embeds');

    // Register navigation menus
    register_nav_menus(array(
        'primary' => esc_html__('Primary Menu', 'olon-sentiment-tv'),
        'footer' => esc_html__('Footer Menu', 'olon-sentiment-tv'),
    ));
}
add_action('after_setup_theme', 'olon_theme_setup');

/**
 * Custom rewrite rules for category and post permalinks
 */
function olon_rewrite_rules() {
    add_rewrite_rule(
        '^category/([^/]+)/?$',
        'index.php?olon_category=$matches[1]',
        'top'
    );

    add_rewrite_rule(
        '^post/([^/]+)/?$',
        'index.php?olon_post=$matches[1]',
        'top'
    );
}
add_action('init', 'olon_rewrite_rules');

/**
 * Add custom query vars
 */
function olon_query_vars($vars) {
    $vars[] = 'olon_category';
    $vars[] = 'olon_post';
    return $vars;
}
add_filter('query_vars', 'olon_query_vars');

/**
 * Template routing for custom URLs
 */
function olon_template_include($template) {
    $category_slug = get_query_var('olon_category');
    $post_slug = get_query_var('olon_post');

    if ($category_slug) {
        $custom_template = locate_template('templates/archive.html');
        if ($custom_template) {
            return $custom_template;
        }
    }

    if ($post_slug) {
        $custom_template = locate_template('templates/single.html');
        if ($custom_template) {
            return $custom_template;
        }
    }

    return $template;
}
add_filter('template_include', 'olon_template_include');

/**
 * Flush rewrite rules on theme activation
 */
function olon_activate() {
    olon_rewrite_rules();
    flush_rewrite_rules();
}
add_action('after_switch_theme', 'olon_activate');

/**
 * Flush rewrite rules on theme deactivation
 */
function olon_deactivate() {
    flush_rewrite_rules();
}
add_action('switch_theme', 'olon_deactivate');

/**
 * Admin notice if Supabase credentials are missing
 */
function olon_admin_notice() {
    if (!defined('SUPABASE_URL') || !defined('SUPABASE_ANON_KEY')) {
        $class = 'notice notice-warning';
        $message = __('OLON Sentiment TV: Supabase credentials not configured. Add SUPABASE_URL and SUPABASE_ANON_KEY to wp-config.php', 'olon-sentiment-tv');
        printf('<div class="%1$s"><p>%2$s</p></div>', esc_attr($class), esc_html($message));
    }
}
add_action('admin_notices', 'olon_admin_notice');
