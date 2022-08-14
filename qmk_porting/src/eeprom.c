#include "eeprom.h"
#include <logging/log.h>
LOG_MODULE_REGISTER(main, CONFIG_ZMK_LOG_LEVEL);

static struct nvs_fs fs;
static bool initialized = false;

void nrf_eeprom_init()
{
	if (initialized) {
		return;
	}
}