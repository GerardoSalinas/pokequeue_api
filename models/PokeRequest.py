from pydantic import BaseModel, Field
from typing import Optional

class PokeRequest(BaseModel):
    id: Optional[int] = Field(
        default=None,
        ge=1,
        description="Id de la peticion"
    )

    pokemon_type: Optional[str] = Field(
        default=None,
        pattern="^[A-Za-z_]+$",
        description="Tipo del pokemon"
    )

    url: Optional[str] = Field(
        default=None,
        pattern="^https?://[^\s]+$",
        description="URL de la peticion"
    )

    status: Optional[str] = Field(
        default=None,
        pattern="^(sent|completed|failed|inprogress)$",
        description="Estado de la peticion"
    )


