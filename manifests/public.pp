node default {
    class { compbox:
        configure_main_user_access  => true,
        main_user                   => 'root',
        manual_npm_installs         => false,
        enable_tls                  => false,
        track_source                => true
    }
}
