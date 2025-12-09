' RootBeer Game Engine (For FreeBASIC)
' Vector library

type Vector2
    X as single
    Y as single
    
    Declare Operator Cast() As String
    
    Declare Operator += (ByVal Scalar As Single)
    Declare Operator -= (ByVal Scalar As Single)
    Declare Operator *= (ByVal Scalar As Single)
    Declare Operator /= (ByVal Scalar As Single)
end type

'Declare Operator + (ByRef LeftScalar As Vector2, ByRef RightScalar As Vector2) As Vector2
'Declare Operator - (ByRef LeftScalar As Vector2, ByRef RightScalar As Vector2) As Vector2

Operator Vector2.Cast () As String
  Return "(" + Str(X) + ", " + Str(Y) + ")"
End Operator

Operator Vector2.+= ( ByVal Scalar As Single )
  This.X = This.X + Scalar
  This.Y = This.X + Scalar
End Operator

Operator Vector2.-= ( ByVal Scalar As Single )
  This.X = This.X - Scalar
  This.Y = This.X - Scalar
End Operator

Operator Vector2.*= ( ByVal Scalar As Single )
  This.X = This.X * Scalar
  This.Y = This.X * Scalar
End Operator

Operator Vector2./= ( ByVal Scalar As Single )
  This.X = This.X / Scalar
  This.Y = This.X / Scalar
End Operator