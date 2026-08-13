Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011192BCF46
	for <fuse-devel@lists.linux.dev>; Thu, 13 Aug 2026 18:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786644606; cv=pass; b=dr3uSgLtqFuFck7tZi99JcD9rvqUyHIX0zQRBIK+PM2T0TO4oMb5gWwKbUUEY9d8eI92DgHU6M4Lf5mvgSsrEZ5NCGIhXdOwOV7c2umg02Q4UGa+PkL+tuIb9i2Fh5YveC5v61+RvNMeBktVuxGqSqFSLIRts2Sg6GpqgJiXnrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786644606; c=relaxed/simple;
	bh=HGBUsRebAhmPFg+HXuwa1wHil6Pl0uTbBmhShTsFPX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jx6X9qfskYyeUS/bqGwkzPGmHQZAS7izdcQ3zhSCw0Wj/UIscABu93KdaT+rKcsPVQD3ELgeMbtwSh/QY03DRL4548s7OimsvXbRYLcetsP3l/i3VgljILoObR6Pk+vvTCI8S/8ITBxF1VdzwFnPMx3dsqFnd66OgHHWgzIB8b8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mJjTYacc; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJjTYacc"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-472326ca506so86388f8f.2
        for <fuse-devel@lists.linux.dev>; Thu, 13 Aug 2026 11:10:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786644603; cv=none;
        d=google.com; s=arc-20260327;
        b=DGJtFNQmPKI4w/cf7hLzjn9JodR0OUxsb/JoNFyPEuT6THT86QBZDbs/LB5JaSSrwz
         VsZH58zBM5Z5vEAW7NYntSLEYr5mj+ysUPIwhtBxXOtPqFmwS53Rx8wLDDCFdSPxAyLX
         jtcu3SUjtUYLjH9Pz1CCYkXAlUCKBCbOxQz2f/gkLaWYDplQj2sYe+TQYpXO97RX/nFM
         doxpz8GriJzl4By9BlY1XwgJn9KP5gkWW6Xk9zhlb+BZTPN9a3d7KHTnvJwM4C5m/Gzx
         geYrZj6TvVOLnxKsJ3czJ/UmG2Cvb1dwpnAVIWAnLTdhm83cUFnDMc04V/jXtVcJDWiM
         4v4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BEmXLs/ISF7rbT3I4CcxBjbJet7fRlkZGOCw5t6P8Pg=;
        fh=QKe4nPeXMIFdBKz4qz4x8AOSh6VUWjLMg2WnjmMvnfY=;
        b=OHR5srUWkjKzbOMi0GcIqhwcrlwpnn7gyMBBr7VknWLmTsmzVchPrb0KDTHRmTrUnQ
         M2Q4c6YgF2hIYmObsjNW63CCZFFbNTCXMDjnLBHar60lwGWD6MZeWfPqxx8/anFNYzkx
         pGLWzgQUD9MXZjq0mh5q1i+g46c3C63Pfwz4UjMgAkhJ7mgCQlWrnJQciR0eunSV7Nck
         eHNAIoSi0gDUC30Max+r2QATopirEuxbSW8NnOlXF7e/NhoJdu/be38nfcmCoSB4s+uf
         m5TwvYo1hVeWKctC5fO7MUzxgHwKwe6bPZVjE/BLS7wB7aw789lLgk2HLf7ooFuNzYsq
         IFLw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786644603; x=1787249403; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BEmXLs/ISF7rbT3I4CcxBjbJet7fRlkZGOCw5t6P8Pg=;
        b=mJjTYaccBPsf1BETO1amcVA6z0hZufSSF2gCr9ghoPFooLoA6Dg3Gf+jSN5QxJwaoG
         SPJNu958xlWdZbfWGXNgIicu5MqmNp/4kKSFpfBLc4nCQsnaNK8XFU4oqR/FD5Rn+IVy
         KqLFLnRJGYiM+gCH+LeKuub1+goE2ewbhSc/VrI224sdZPvdbQpgYnUqXGa5fQk76YbX
         t3pKyAaF81UWRKwn2XZI+Q4HIEvFgpX4z2LEcOvJj2UzXl52CYFSkkUO5iOFwV9pwPoY
         qbErsI+i0oi/wwbaNGqFZIPuSw7GcBJNfrXl1qekLXUtB1gq/+HRpnqODN4Ow3ESgWvG
         JG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786644603; x=1787249403;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BEmXLs/ISF7rbT3I4CcxBjbJet7fRlkZGOCw5t6P8Pg=;
        b=N+6zszLKXp7/dtLnZcNVQBBMHOkiwEGBwxKjF3V/CNGhaIMC9iuIcZA/XhvtpSX1pQ
         ZIJVhaso6PDRuXiez9B+3LZFaZKiQiSt7AuEX+5A85F6ioAzcpg8HqJSUVMXajtJx3yU
         6cpcF3o0VQrEZbD7JP/ajTZCz0fMZgjp3jXA1GgpUWTYhBeHVDyulFVulqrItgOCuJXk
         6R9ze1OM+IAQg0U8bDYDuRLiCbxKr1LhiobCfYByH5vOrfChFAlp8pt/ViIJHwbKRWY/
         VWuXKEIAfC4ffNXgK4yyXq0c7vQkhz0VRHrDkLxlG8BeSZyBEZW8JTlQuTwoR/KMZYxQ
         +hQw==
X-Forwarded-Encrypted: i=1; AHgh+RpRA5fMX34ZG+SJ74le99646NCHqdn1lhQzpqPerbLvplLTmMjL50BWkzDxMZ4NfTw1wEAgoUt98nSg@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3y+KhU7XB4ax30aZ1WzwcIDfk8OpCfC3v7vMyJ9tAkvwVOjn4
	VAKJn0uC7OG43Trj8vecd7GCUv0p1XNQqh/KlUOBHRSvxWnaBMN2KyNLyUb9Uge2MaELYGAsXi9
	iksw+vB+WQBTdrZzvSgB9gEjRT1GAvLg=
X-Gm-Gg: AR+sD10T4NfQi7Y/CDwciqxIRJU5hNfAlWv0+z2egp/Rim+VnDrmgLzbvfPoy2ivlAH
	FQOOtVU1d8GjJm4maMttuwWUb5iMFrh/eIknFmny/F7f6l2bhT7rBd/+IU5Rw0CLN4jCrW/UGZ3
	afnEWLEEvlxKeZNEC0X0Vsb9NjXeqBAcBCX5LlPiSj0ycgAY05wOkOQQjG+MSRvcRrSDFgQIdZv
	bnsr9FjcnuoiCkMWeTKlil9CvAVNIWu0n1vyFffwJ1wO9SQkq6O6TxRoBHp3CryVPspK5T+jGhy
	2EzlI/m5VAQ6Pjm0xK3ro95NKkFlkukjYvAtq9/BWnj9PSqkh9UJmgpNlFC729saGGE0h816OXP
	n+LGyV9E1OLnU2RuKqSKv/HG+
X-Received: by 2002:adf:f252:0:b0:477:47c6:36e5 with SMTP id
 ffacd0b85a97d-48160788330mr79165f8f.25.1786644602972; Thu, 13 Aug 2026
 11:10:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716175908.2339738-1-joannelkoong@gmail.com>
 <20260716175908.2339738-6-joannelkoong@gmail.com> <777e9671-aff7-41e7-911c-dc3aacc877f3@bsbernd.com>
 <CAJnrk1bmxOXn=4W8fgn1ckGsoJasQ0AzuZpBP46uA3bhQvyjLA@mail.gmail.com> <d8ead20f-91b6-49d6-95f5-f54dd76a411d@bsbernd.com>
In-Reply-To: <d8ead20f-91b6-49d6-95f5-f54dd76a411d@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 13 Aug 2026 11:09:50 -0700
X-Gm-Features: AUfX_my62AHGILWwk2xaNUSBLTtLeNlBOiFlz7-YlIYFNlt7W_KNR7Obo-PQOLM
Message-ID: <CAJnrk1Yw7Pf96GQpguY3HjzfTn47r+O8KGWQZJmuikC5aAGP7Q@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] fuse: add zero-copy over io-uring
To: Bernd Schubert <bernd@bsbernd.com>
Cc: miklos@szeredi.hu, jlayton@kernel.org, libaokun@linux.alibaba.com, 
	axboe@kernel.dk, amir73il@gmail.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 10:01=E2=80=AFAM Bernd Schubert <bernd@bsbernd.com>=
 wrote:
>
>
>
> On 8/13/26 01:19, Joanne Koong wrote:
> > On Wed, Aug 12, 2026 at 3:30=E2=80=AFPM Bernd Schubert <bernd@bsbernd.c=
om> wrote:
> >>
> >>> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> >>> index d50792162d8b..3d1910a9db52 100644
> >>> --- a/fs/fuse/dev.c
> >>> +++ b/fs/fuse/dev.c
> >>> @@ -1247,11 +1247,20 @@ int fuse_copy_folio(struct fuse_copy_state *c=
s, struct folio **foliop,
> >>>
> >>> @@ -746,6 +786,62 @@ static int fuse_uring_copy_from_ring(struct fuse=
_req *req,
> >>>       return err;
> >>>  }
> >>>
> >>> +static void fuse_zero_copy_release(void *priv)
> >>> +{
> >>> +     struct fuse_zero_copy_bvs *zc_bvs =3D priv;
> >>> +     unsigned int i;
> >>> +
> >>> +     for (i =3D 0; i < zc_bvs->nr_bvs; i++)
> >>> +             folio_put(page_folio(zc_bvs->bvs[i].bv_page));
> >>> +
> >>> +     kfree(zc_bvs);
> >>
> >> kvfree (see below)?
> >>
> >>> +}
> >>> +
> >>> +static int fuse_uring_set_up_zero_copy(struct fuse_ring_ent *ent,
> >>> +                                    struct fuse_req *req,
> >>> +                                    unsigned int issue_flags)
> >>> +{
> >>> +     struct fuse_args_pages *ap;
> >>> +     int err, i, ddir =3D 0;
> >>> +     struct fuse_zero_copy_bvs *zc_bvs;
> >>> +     struct bio_vec *bvs;
> >>> +
> >>> +     /* out_pages indicates a read, in_pages indicates a write */
> >>> +     if (req->args->out_pages)
> >>> +             ddir |=3D IO_BUF_DEST;
> >>> +     if (req->args->in_pages)
> >>> +             ddir |=3D IO_BUF_SOURCE;
> >>> +
> >>> +     ap =3D container_of(req->args, typeof(*ap), args);
> >>> +
> >>> +     zc_bvs =3D kmalloc(struct_size(zc_bvs, bvs, ap->num_folios),
> >>> +                      GFP_KERNEL_ACCOUNT);
> >>
> >> Assuming one folio per page and 1MB max_nr_pages:
> >>
> >> struct_size(zc_bvs, bvs, n) =3D=3D 8 + 16 * 256 =3D 4104
> >>
> >> Shouldn't this be kvmalloc()?
> >
> > I'm not sure what the upper limit is for a kmalloc, but I'll change
> > this to kvmalloc().
>
>
> As far as I know kmalloc will allocate continuos pages and might fail
> under fragmentation if more than a page is needed. I'm not entirely sure
> if kvmalloc for such a small allocation will actually do the job.
> How about the attached patch? And with that maybe we should limit
> max_nr_pages to 256 for ZC?

I think kvmalloc should be fine. For size > PAGE_SIZE it tries kmalloc
first and has a fallback to vmalloc. For small allocations, kvmalloc
is just plain kmalloc.

Thanks,
Joanne
