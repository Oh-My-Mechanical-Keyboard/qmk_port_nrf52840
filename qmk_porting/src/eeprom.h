#pragma once

#include <drivers/flash.h>
#include <storage/flash_map.h>
#include <fs/nvs.h>

#define STORAGE_NODE_LABEL storage

/* 1000 msec = 1 sec */
#define SLEEP_TIME 1000
/* maximum reboot counts, make high enough to trigger sector change (buffer */
/* rotation). */
#define MAX_REBOOT 400

#define ADDRESS_ID 1
#define KEY_ID 2
#define RBT_CNT_ID 3
#define STRING_ID 4
#define LONG_ID 5

void nrf_eeprom_init();