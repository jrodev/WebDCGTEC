﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using WebApiApp;

namespace WebApiApp.Controllers
{
    public class UsuariosController : ApiController
    {
        private DbDomainEntities db = new DbDomainEntities();

        // GET: api/Usuarios
        public IQueryable<usuario> Getusuarios()
        {
            return db.usuarios;
        }

        // GET: api/Usuarios/5
        [ResponseType(typeof(usuario))]
        public IHttpActionResult Getusuario(int id)
        {
            usuario usuario = db.usuarios.Find(id);
            if (usuario == null)
            {
                return NotFound();
            }

            return Ok(usuario);
        }

        // PUT: api/Usuarios/5
        [ResponseType(typeof(void))]
        public IHttpActionResult Putusuario(int id, usuario usuario)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);      
            }

            if (id != usuario.id)
            {
                return BadRequest();
            }

            db.Entry(usuario).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!usuarioExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Usuarios
        [ResponseType(typeof(usuario))]
        public IHttpActionResult Postusuario(usuario usuario)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.usuarios.Add(usuario);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = usuario.id }, usuario);
        }

        // DELETE: api/Usuarios/5
        [ResponseType(typeof(usuario))]
        public IHttpActionResult Deleteusuario(int id)
        {
            usuario usuario = db.usuarios.Find(id);
            if (usuario == null)
            {
                return NotFound();
            }

            db.usuarios.Remove(usuario);
            db.SaveChanges();

            return Ok(usuario);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool usuarioExists(int id)
        {
            return db.usuarios.Count(e => e.id == id) > 0;
        }
    }
}