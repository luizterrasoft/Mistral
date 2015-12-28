#if !defined( _QZECF_DLL32_ )
	#define QZECFDLL32_API		__declspec( dllimport )
#else
	#define QZECFDLL32_API		__declspec( dllexport )
#endif

#define Std_Call		__stdcall

#ifdef _cplusplus
	extern "C" {
#endif
QZECFDLL32_API void	Std_Call QZ1000_VersaoDLL( char *pbuffer );
QZECFDLL32_API void Std_Call QZ1000_AtivaLOG( void );
QZECFDLL32_API void	Std_Call QZ1000_AtivaLOGHEX( void );
QZECFDLL32_API void Std_Call QZ1000_DesativaLOG( void );
QZECFDLL32_API int	Std_Call QZ1000_LeBufferRetorno( char *pBuffer );
QZECFDLL32_API int	Std_Call QZ1000_InicializaPortaSerial( int porta );
QZECFDLL32_API int	Std_Call QZ1000_FechaPortaSerial( void );
QZECFDLL32_API int	Std_Call QZ1000_ConfiguraValorDeTimeout( int rxTimeout ,int txTimeout ,int operTimeout );
QZECFDLL32_API int	Std_Call QZ1000_LeRetorno( void );
QZECFDLL32_API int	Std_Call QZ1000_EnviaComando( const char *str );
#ifdef _cplusplus
	}
#endif
