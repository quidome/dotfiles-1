class Color(DefaultColor):
    USERNAME_FG = 0
    USERNAME_BG = 5
    USERNAME_ROOT_BG = 1

    HOSTNAME_FG = 0
    HOSTNAME_BG = 10

    HOME_SPECIAL_DISPLAY = False
    PATH_FG = 7
    PATH_BG = 0
    CWD_FG = 7
    SEPARATOR_FG = 3

    READONLY_BG = 1
    READONLY_FG = 7

    REPO_CLEAN_FG = 14
    REPO_CLEAN_BG = 0
    REPO_DIRTY_FG = 3
    REPO_DIRTY_BG = 0

    JOBS_FG = 4
    JOBS_BG = 8

    CMD_PASSED_FG = 5
    CMD_PASSED_BG = 0
    CMD_FAILED_FG = 0
    CMD_FAILED_BG = 1

    SVN_CHANGES_FG = REPO_DIRTY_FG
    SVN_CHANGES_BG = REPO_DIRTY_BG

    VIRTUAL_ENV_BG = 15
    VIRTUAL_ENV_FG = 2