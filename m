Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED59380FD1
	for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 07:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790062587; cv=pass; b=S6qirFtH/rmdYul650JcbOWGRyFN2RGAPVNduBQWXMF0J/BHO0hOnte+zh9St9psxUfV/IYz/CRl15vaBvEFNX0mECVS0rHN3GJPv8xzh6sSLnqkwRFjvC8MYxsOq4+z9TG15lmg9JCqygWsVrfTDibCKfwDWjNn0Hl2AJHtXA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790062587; c=relaxed/simple;
	bh=LQ3W0Ji3FHh7+nMw3k2Xb+ss1iO5r5BUGKzJnuCZXr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PGcXkDz81OOKPb58VIQZPGQgoqRdU8zhzVltXTkumEjcYwaWfQBoAHuLeuFP1jWabYr9gbHENI7Im6AKjyRr4v+SxjfF0Y4x30aeYPNJDkGjPDfkHc1BvtZIrif8CAnE8V3vDvmRjkaNpCiV806r4Xd+w05iZULam/FqHJsjQvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZu5L3DC; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZu5L3DC"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2946aa0d5aso88810466b.0
        for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 00:36:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790062584; cv=none;
        d=google.com; s=arc-20260327;
        b=I2b3lwplwuxDDJHzwMhR1PCIvndNhE8Qx2h5Lrm3Uj7RgNFJz4QktqAedaU8y5CuT3
         M9C1Vq45mglODcV11NJhCdhlF/2LmHf1T/WWf+NP9FWUMR3wP/OuY1TNDm2pnt84o97X
         9oyU8ycaNDeG4Oiqpe4AE45cR+YpoPCBbayWML2X0/whU2Dh14A0cw0R3VVIP5+bycAW
         OYSIS40R9OF9fDP8vhsaiqM9cGg4x9x72SwS1meuagSM5ypoHl7Dx/OtvSQfi3mU6R8y
         D9QdsZfqsale45k+HXCBPTW9mguT6Qgx7XlpFbU1eEyBQ+5QJdpQ5Gc771RQNxo5wZZa
         Zbyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YwCGQY/pbU55CKIKeuvtTV2ASD3xwF18SDyMYRLrMc8=;
        fh=ofgrggqVjLWk44mDmmnIwqkjoKIW8VD/Jxn/aCtrENY=;
        b=OQA+ytUiEGJC5sRF5u+WWV2OobDnJcTXTkN/2AS1ikNd1e0AFtgg5nrb6Hct/2qZd5
         NfaFUiH3JtvkCPMjGOIUUy1D6u8NR4xgN9ujy+WtIKOLro/wQ8z+FUxxFX8qhsNQhDtE
         hdAnUbKOOmrA/nmBLvye9aFX3aXh4LuNVtZAe8cGWnuEz6xDONXZ44VQ+p23CV0nHpNu
         8O4VylJzVd0pJQiF+BAS7U7qWKv568WlsHvXRpugWHmMSf6+5I5pUWQbB1JaYaIdLFeg
         hstwdCMRRiCqn9j0h6ftF6stXgZZPZPHIqzeHED+dQXuyNj0yNPZilSBi3lS4M3Mk+IF
         OSYg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790062584; x=1790667384; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YwCGQY/pbU55CKIKeuvtTV2ASD3xwF18SDyMYRLrMc8=;
        b=IZu5L3DCIWLvxY8GzIm8/z+U87T2PpswgWpb3uzAvfXb+m5FHKAt8PdKkD89ikADo0
         SBZjqSeWCxSOfaohEU7igPl8L+HabSHuB9pX+xY9iCiiBueU1P4wHXiHy8mubFpxS+A7
         0c4zRJItYyv+OrXVxPDhJEm0Mj0b/J+JWQ5QVJmG6/G0uzmgWp5WOmCFWyH2U+su/oqC
         DDhybffEABENSUPr4hmLBLBy0O5p1xZVUrIChJ24fSDMrkIiCntqTjjt977VJX2ulPc0
         kLFLJ+UXwb8TCpa+K9mw9a/vimacofsKgHI2SpFNIsGSRGrnq5qc/6xGnPkI7vKBJkIi
         mvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790062584; x=1790667384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YwCGQY/pbU55CKIKeuvtTV2ASD3xwF18SDyMYRLrMc8=;
        b=CsUSJKeB8z3v6Z9YRYP3LKtkq7nZ1PyxZZyTlcBzWOLVlWcXz/5e+slPrZMFvLY4PD
         OfOG8lmme3JGrxBBVaLDr/OBUu3nq7YkK9pSUhFLn4NIAqiVmPn8+A9SaOjpwoKZZZ3T
         WGeI9JTY6oCpSwTrfN0Q0hjpR1b1CdH95eCQPgM4vdwaYKZ/iikwXUlbwuWiwEBR4HZ7
         hEtcn2+DIXjDQNZWgg3wmw0x9JKll5WWbXPoWaYazn2QZkJw2YoIs8iNEDGI4pa+x6Yr
         5dk4ctEI17a4NXXI1Nld9ehjFQsOgqAhw8Vyf3F7+gQnBDALLlx7lH8QFOiVnSYSdCuM
         62UA==
X-Gm-Message-State: AFuF++n6La+SK0hJXHcdmtfAPRHj3qcGNZGJRWb0t3jaStuEWbuf7pDJ
	YtluM+2pOHMGkE6ZWbQzecJgzpDer+tCttUCUN6OG8QKfbO7Tj/m59euEwDiTUZX59AiiYOLh8m
	s/OEOxA2VDmRmOVFn64biCBiRVt+9sGo=
X-Gm-Gg: AYBFou0rI99I3JoD9ip3KS8DNE6d0dP9ijkWL4D5m5g3Zj+ESLw5Ft51YNOuBLZWBvT
	KjhhRi35Uui/rtj2SH/2IJyDxhGtSc5KPZ3V7B7iQf/G9ofEmIFKQ4+xuJ4IO9DMg/u/mOy/lkX
	VSTe5HEqsSCHKH5S8V0SSPyFJ+T5HASmeB9g8A2jPQ16g1v7RKLdH9oiFwt1q3bFyaura4b71UE
	jVYghuLIP/vb7zkGhFjvb6R2L+i+5tFpuzYQIdOiF6n5XSsBGjK1QLf2KHabGuqjt4eRNTEh9nY
	BpPEWUC2MBNqftVHMGqgGmQppHb0Fqqx3Gayrzw6dU+dWERrDkyMhB8X
X-Received: by 2002:a17:907:db02:b0:c26:1f8f:ed53 with SMTP id
 a640c23a62f3a-c2a8d522b8dmr146056166b.12.1790062583912; Tue, 22 Sep 2026
 00:36:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922061019.3320196-1-mszeredi@redhat.com> <20260922061019.3320196-2-mszeredi@redhat.com>
In-Reply-To: <20260922061019.3320196-2-mszeredi@redhat.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 22 Sep 2026 09:36:12 +0200
X-Gm-Features: AcwNN1Vxewz6u0MEeBHf3xQuSC4jN3RqiBkiYe8Rl-mEJQrk3sXqTpPpu8R67Lk
Message-ID: <CAOQ4uxhd4npLNMEGjTBdO3nmwTzjixg7zCxf6ZCZ8nFJcf=xEQ@mail.gmail.com>
Subject: Re: [PATCH 01/11] dax: replace exported dax_dev_get() with
 non-allocating dax_dev_find()
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: fuse-devel@lists.linux.dev, John Groves <John@groves.net>, 
	"Darrick J . Wong" <djwong@kernel.org>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 8:10=E2=80=AFAM Miklos Szeredi <mszeredi@redhat.com=
> wrote:
>
> From: John Groves <John@Groves.net>
>
> This fix is in response to a Sashiko review, and some subsequent
> analysis.
>
> dax_dev_get() uses iget5_locked() which creates a new inode if no
> matching one exists. This is correct for the internal caller
> (alloc_dax), but dangerous for external callers that look up devices
> from user-supplied or metadata-supplied dev_t values:
>
> 1. A new inode is created with DAXDEV_ALIVE set but no backing driver,
>    no ops, and no IDA-allocated minor number.
>
> 2. On teardown, dax_destroy_inode() warns because kill_dax() was never
>    called, and dax_free_inode() calls ida_free() for a minor that was
>    never ida_alloc'd -- potentially freeing the minor of a real device.
>
> Add dax_dev_find() which uses ilookup5() for lookup-only semantics:
> it returns an existing dax_device with an elevated inode reference, or
> NULL if no device with the given dev_t exists. It never creates inodes.
> A dax_alive() check under dax_read_lock() guards against returning a
> device that is concurrently being torn down by kill_dax().
>
> Make dax_dev_get() static again (internal to super.c for alloc_dax),
> export dax_dev_find() instead

, and update the two external callers
> (famfs_inode.c, famfs.c). Also add the missing CONFIG_DAX=3Dn stub.

prune stale text


>
> About the 'fixes' tag: this removes the export of dax_dev_get(),
> which was flawed, and replaces is with dax_dev_find(). It feels like
> the fixes tag makes sense for correcting an ABI error.
>
> Fixes: 2ae624d5a555d ("dax: export dax_dev_get()")
> Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> Reviewed-by: Alison Schofield <alison.schofield@intel.com>
> Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
> Signed-off-by: John Groves <john@groves.net>
> Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> ---
>  drivers/dax/super.c | 38 ++++++++++++++++++++++++++++++++++++--
>  include/linux/dax.h |  6 +++++-
>  2 files changed, 41 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dax/super.c b/drivers/dax/super.c
> index 45f84b0eb909..824e1f6df378 100644
> --- a/drivers/dax/super.c
> +++ b/drivers/dax/super.c
> @@ -565,7 +565,7 @@ static int dax_set(struct inode *inode, void *data)
>         return 0;
>  }
>
> -struct dax_device *dax_dev_get(dev_t devt)
> +static struct dax_device *dax_dev_get(dev_t devt)
>  {
>         struct dax_device *dax_dev;
>         struct inode *inode;
> @@ -588,7 +588,41 @@ struct dax_device *dax_dev_get(dev_t devt)
>
>         return dax_dev;
>  }
> -EXPORT_SYMBOL_GPL(dax_dev_get);
> +
> +/**
> + * dax_dev_find - look up an existing dax_device by dev_t
> + * @devt: the device number to find
> + *
> + * Returns a dax_device with an elevated inode reference, or NULL if no
> + * device with the given dev_t exists. Unlike dax_dev_get(), this never
> + * allocates a new inode -- it is safe for external callers that are loo=
king
> + * up devices from user-supplied or metadata-supplied dev_t values.
> + *
> + * Caller must put_dax() the returned device when done.
> + */
> +struct dax_device *dax_dev_find(dev_t devt)
> +{
> +       struct dax_device *dax_dev;
> +       struct inode *inode;
> +       int id;
> +
> +       inode =3D ilookup5(dax_superblock, hash_32(devt + DAXFS_MAGIC, 31=
),
> +                        dax_test, &devt);
> +       if (!inode)
> +               return NULL;
> +
> +       dax_dev =3D to_dax_dev(inode);
> +       id =3D dax_read_lock();
> +       if (!dax_alive(dax_dev)) {
> +               dax_read_unlock(id);
> +               iput(inode);
> +               return NULL;
> +       }
> +       dax_read_unlock(id);
> +
> +       return dax_dev;
> +}
> +EXPORT_SYMBOL_GPL(dax_dev_find);
>
>  struct dax_device *alloc_dax(void *private, const struct dax_operations =
*ops)
>  {
> diff --git a/include/linux/dax.h b/include/linux/dax.h
> index fe6c3ded1b50..29113eb95e72 100644
> --- a/include/linux/dax.h
> +++ b/include/linux/dax.h
> @@ -54,7 +54,7 @@ struct dax_device *alloc_dax(void *private, const struc=
t dax_operations *ops);
>  void *dax_holder(struct dax_device *dax_dev);
>  void put_dax(struct dax_device *dax_dev);
>  void kill_dax(struct dax_device *dax_dev);
> -struct dax_device *dax_dev_get(dev_t devt);
> +struct dax_device *dax_dev_find(dev_t devt);
>  void dax_write_cache(struct dax_device *dax_dev, bool wc);
>  bool dax_write_cache_enabled(struct dax_device *dax_dev);
>  bool dax_synchronous(struct dax_device *dax_dev);
> @@ -92,6 +92,10 @@ static inline void put_dax(struct dax_device *dax_dev)
>  static inline void kill_dax(struct dax_device *dax_dev)
>  {
>  }
> +static inline struct dax_device *dax_dev_find(dev_t devt)
> +{
> +       return NULL;
> +}
>  static inline void dax_write_cache(struct dax_device *dax_dev, bool wc)
>  {
>  }
> --
> 2.54.0
>
