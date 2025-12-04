#include "xgpiops.h"
#include "sleep.h"
#include "xparameters.h"
#include "xstatus.h"

// 假设 LED0 连接在 MIO7，LED1 连接在 MIO8
// 请根据你的原理图确认 MIOLED0 的引脚号！
#define MIOLED0 7
#define MIOLED1 8
#define GPIO_DEVICE_ID XPAR_PS7_GPIO_0_DEVICE_ID

XGpioPs Gpio; // GPIO 设备的驱动程序实例

int main()
{
    int Status;
    XGpioPs_Config *ConfigPtr;

    print("MIO Running Light Test! \n\r");

    ConfigPtr = XGpioPs_LookupConfig(GPIO_DEVICE_ID);
    Status = XGpioPs_CfgInitialize(&Gpio, ConfigPtr, ConfigPtr->BaseAddr);

    if (Status != XST_SUCCESS){
        return XST_FAILURE;
    }

    // --- 配置阶段 ---
    // 设置指定引脚的方向：1 代表输出
    XGpioPs_SetDirectionPin(&Gpio, MIOLED0, 1);
    XGpioPs_SetDirectionPin(&Gpio, MIOLED1, 1);

    // 使能指定引脚输出：1 代表使能
    XGpioPs_SetOutputEnablePin(&Gpio, MIOLED0, 1);
    XGpioPs_SetOutputEnablePin(&Gpio, MIOLED1, 1);

    // --- 循环控制阶段（流水灯逻辑）---
    while (1) {
        // 第一拍：左亮右灭
        XGpioPs_WritePin(&Gpio, MIOLED0, 0x1);
        XGpioPs_WritePin(&Gpio, MIOLED1, 0x0);
        sleep(1);

        // 第二拍：左灭右亮
        XGpioPs_WritePin(&Gpio, MIOLED0, 0x0);
        XGpioPs_WritePin(&Gpio, MIOLED1, 0x1);
        sleep(1);
    }

    return XST_SUCCESS;
}
