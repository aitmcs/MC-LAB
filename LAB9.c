#include<lpc214x.h>
char toLower(char ch);
char toUpper(char ch);
void UART0_Init(void){
	PINSEL0 |= 0x00000005;
	
	U0LCR = 0x83;
	U0DLL = 0x61;
	U0DLM = 0x00;
	U0LCR = 0x03;
}
void UART0_SendChar (char c){
	while (!(U0LSR & 0x20));
	U0THR = c;
}
char UART0_ReceiveChar(void)
{
	while (!(U0LSR & 0x01));
  return U0RBR;
}

void UART0_SendString(const char *str)
{
	while(*str)
	{
		UART0_SendChar(*str++);
	}
}
void UART0_ReceiveString(char *str,int maxLength)
{
	char c;
	int i=0;
	while(i < maxLength -1)
	{
		c=UART0_ReceiveChar();
		if(c == '\r' || c == '\n')
		{
			break;
		}
		str[i++]=c;
		UART0_SendChar(c);
	}
	str[i]='\0';
}
void toLowerString(char *str)
{
	while(*str)
	{
		*str = toLower(*str);
    str++;
	}
}
void toUpperString(char *str)
{
	while(*str)
	{
		*str = toUpper(*str);
		str++;
	}
}
int main()
{
	char str[100];
	UART0_Init();
	UART0_SendString("Enter String in Upper case:");
	UART0_ReceiveString(str, sizeof(str));
  UART0_SendString("\r\nLowercase conversion:");
  toLowerString(str);
  UART0_SendString(str);
	UART0_SendString("\r\n");
	UART0_SendString("Enter string in Lower case:");
	UART0_ReceiveString(str, sizeof(str));
  UART0_SendString("\r\nUppercase conversion:");
  toUpperString(str);
  UART0_SendString(str) ;
  UART0_SendString("\r\n");
return 0;
}
char toLower (char ch)
{
	if(ch>='A' && ch<='Z')
  {
    return ch + ('a'-'A');
	}
  else{
    return ch;
	}
}
char toUpper(char ch)
{
	if(ch>='a' && ch<='z')
	{
		return ch - ('a'-'A');
	}
	else{
		return ch;
	}
}
