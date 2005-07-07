
! Fourth order Runge-Kutta integrator. Needs the module nrtype from Numerical Recipes,
! that defines data types. Time is treated as an extra variable of the system 
! so that the program needs fewer modifications to construct Poincare sections.
! Here a version to integrate a system of ODE's defined in a complex space is given.
! Uses KS equations as example. 


PROGRAM integr

use parameters
USE nrtype
USE ifc_integr

IMPLICIT NONE

REAL(dp), DIMENSION(:,:), ALLOCATABLE :: y
REAL(dp) :: ti=0.0_dp, tf=10.0_dp
INTEGER(I4B) :: nsteps=100000, xsteps=32, nrep =10,  d=16,i, k, j
REAL(DP), DIMENSION(nsteps+1,d) :: Ry, Iy
complex(dpc) :: eminus,eplus
real(dp) :: u(0:xsteps-1, nsteps) 

INTERFACE
	SUBROUTINE KSfield(x,y,dydx)
		USE nrtype
		IMPLICIT NONE
		REAL(dp), INTENT(IN) :: x
		REAL(dp), DIMENSION(:), INTENT(IN) :: y
		REAL(dp), DIMENSION(:), INTENT(OUT) :: dydx	
	END SUBROUTINE KSfield
END INTERFACE

allocate(y(nsteps+1,2*d+1))

y=0.0_dp

OPEN(10, file='ic.dat')

	read(10,*) y(1,d+1:2*d) 

CLOSE(10)

y(1,2*d+1)=ti

y(1,1)=1.0_dp
y(1,2)=1.0_dp
y(1,4)=1.0_dp
y(1,6)=1.0_dp
y(1,9)=1.0_dp

u=0.0_dp

call rk4driver(ti,y(1,:),tf,nsteps,y,KSfield)

do i=1,nrep 
	y(1,:)=y(size(y,1),:) 
	call rk4driver(ti,y(1,:),tf,nsteps,y,KSfield)
end do

do i=1,size(y,1)
	Ry(i,:)=y(i,1:d)
	Iy(i,:)=y(i,d+1:2*d)
end do

do j=0,xsteps-1 ! loop Space
	print *,j
	do k=1,d ! loop Fourier
		eminus=Exp(-ii*k*TWOPI_D*j/(xsteps-1))
		eplus=Exp(ii*k*TWOPI_D*j/(xsteps-1))
!		print *,"-+",eminus,eplus
		do i=1,size(y,1)	!loop time
!			print *,( Ry(i, k) + ii*Iy(i, k) )*eminus + ( Ry(i, k) - ii*Iy(i, k) )*eplus 
			u(j, i) = u(j,i)+( Ry(i, k) + ii*Iy(i, k) )*eminus + ( Ry(i, k) - ii*Iy(i, k) )*eplus 
!			print *, u(j,i)
!			print *, u(j,i)
		end do
	end do
end do

open (10,file='ksu.dat')
	do i=1,size(u,2)
		write(10,flu) u(:,i)
	end do
close(10)

! OPEN(10, file='ksR.dat')
! 
! DO i=1, size(y,1)
! 	WRITE(10,format_label) y(i,1:d) 
! END DO
! 
! CLOSE(10) 
! 
! OPEN(10, file='ksI.dat')
! 
! DO i=1, size(y,1)
! 	WRITE(10,format_label) y(i,d+1:2*d) 
! END DO
! 
! CLOSE(10) 
! 
! OPEN(10, file='kst.dat')
! 
! DO i=1, size(y,1)
! 	WRITE(10,format_label) y(i,2*d+1) 
! END DO

!CLOSE(10) 

END program
