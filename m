Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A851BBBE5
	for <fuse-devel@lists.linux.dev>; Wed, 22 Apr 2026 01:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776819911; cv=pass; b=daODCl24r6uTNljN5TFygvrlTLZA/hzeLIvLJ8pTi5xyvcC8KBeVJX8YKThwEn9fdoakaCa3x8OsVLnPxoMEdhDAMXZako++MLIZDJfxrn4I7ygJArJ30WTz3AWDRfWZnh9vONcys4vunVFPsDCg66xYBQ+TCHBgj/ibLDKSnhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776819911; c=relaxed/simple;
	bh=ln9xO+nLQiIaYZdXN6mQZSTGC6iEtYHxNrpr4orv1DU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NRIhe4s7qba8gCmDAHc58bCOAj6TND5h9apjoMOZq7HaciwoAZII/FJ3LLyGo8GcWzusH3FS7RpErMY+ScHpv/ao/saisOtth/EAq3ZcmvppZvpoxImOBOTzZNAPxLTmXrG0x97rKa7OkrHwPGkHsAM/311XHXGvmXbqVveK5Bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cfbNnYht; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cfbNnYht"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so16844845e9.1
        for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 18:05:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776819908; cv=none;
        d=google.com; s=arc-20240605;
        b=ZNPPL3RLvqgVo8uctTPSWE495eRIYz0WVHEAll69Q5zcqYxpYZCM0gE3IFIw7G17AO
         rNP4O98DC5VZlx90NvtJXNhsR0elw7dw+L9eTxnkAgKnUbB5i+Aq2eNFODwv/DV9Eh+t
         Okacz25CppdoGNAQudKh7pXyN4UTvNePHg2TPEKzazrDYnCOEflgMXYeM0YpWF9nEotz
         AuNFI8qJI78C5C06pzdU1CWCjDVh2n2N/S774nSoqnvOD6XuFhKH6jFihszZC/I7FGy2
         p2Z8cgXJXg1fRx+889gF4eOMQxW8FEX5vqBEX1KIIJ67cN8cNb9GrjYmdgqtjVdTF6HR
         Vh3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YRyvZvatbaV3MURXyNeYc/3KMPQmTDjSspLMhMSE710=;
        fh=lQNwRDocXaIqk9qxrr0NuluVZdPp9vztHJYOIaE9M14=;
        b=ilVD6DRFi6At36OsxWQGYVVwLGYYpbJvF9RoBQWk/9xtb/revmmyXEgMHGTySBsF3/
         tRRHwOxfxQOpAc1b+PpLEpEur/hWz000WYDHDmFKYlb2YfHHyysOkjFPGyb4bLcHFUWx
         qOnoxbVpj5BiVSL1G0AKEwadTaxUnyDQBQgKClkDRZ5tkNiR7VBCH+LSfMCxW9nLm2Ut
         86HzL41Xd25sH4mpB1SCSUbaS16up0NNPuhiWcWPTRSDQwugZIrLGjk1dpOWQJwsKOwM
         SUcQXadW4OlrwG2TVBr26nwapCbTfPG/0lNu+O8iAPc2b0R4R0/rDTTCPnoTzuIkL+jE
         1P+g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776819908; x=1777424708; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRyvZvatbaV3MURXyNeYc/3KMPQmTDjSspLMhMSE710=;
        b=cfbNnYhtvnGFYcMLq01AKJ3emlufYtdAZbA9eQNzp8IWGLzTYj1gipDlUdu8Yhls68
         4iqDMpMtOS9iCUqRGM4ZTbJzvii5IGBtchu4HYBgCo5RPfU7dT6FCdZyaFZSym/b9ak0
         xpaqeUPGBs1xUQ+DxLFZzmRbVmQ4zfA0o+B7Lt2Peoq4dYH+fY382A2SU+RF1xyHGVym
         k/BgaoqnJE7UfnDm2x9W98uNhhVNAF3E00a1H4yqt6AYYTNtNLjJ1ZiKZsiIUvuIc+h0
         vydz7OAZgWYWroFg9w4ClwZW9GdNRd2HZVoiCYqp8IMmll4p816EEXhgCX56HH2HFA7z
         IhCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776819908; x=1777424708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YRyvZvatbaV3MURXyNeYc/3KMPQmTDjSspLMhMSE710=;
        b=WG3gLWCA3suGvA41OTlVw6iml3Z38o1AOmAwc6YTk7M3bP9b2QEWpcv3fpScSwa0C5
         +WrMDO6e4J64kOZR+2+hIwYDe6B7QhgYnvVz6ghYGg89UnTaAbzgNY2UGi3+l3xc0lt8
         1tNOTYODMKwuFWg3B8XzLr7jV4SRAo+MRGa1rbZcED2IBAOtFqPMWIWSmCxxhRRuOKjK
         aGEkv3DHnVneKAJJYVHuOxEPulgGbxfY0eOVCPC5u6gKEp1G8EL8V7wKBzRi3vqC8NAU
         KXIZI1n4z1e1Kir5vhmD/NnLTfP2P8CQ/JZ6VvxljFF3ZbnU1MhSg7LwStrJNhj2gGEl
         kxZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8nUHLtvl7FZwc3DUZ8y1Ux7mN6+UcYMxvp7t57+4fSeD/qcFaGpAG6qju/uMgUg0RwNHmrYaMdPUx2@lists.linux.dev
X-Gm-Message-State: AOJu0YznhmiujQR6IwO0IrflnCJJzaJbluxz7ogLQOvtEoqM7q/4AmZY
	+ibswYUjSyjQlY4zsUlYMgnB38AuElQJ9Hlyi+K58pmO455LT/EdcsCoztX69X+WOiAN88nTPNn
	cg6aYgwcvvYZGexL1YJUxCL0aVxPfnmE3C3Oa
X-Gm-Gg: AeBDietLJk2KYjqOP0/XAkWlLSG2mw7pDDs8CMrU/Qcw2COUC0GMiI2qgskt/0dmiVN
	1Z+htu+HpLbtlNN7bFK3FljkaFTntnNCNKiXeCzou+6A1e8G5619bcIkIyCGMyv2/V+XunptmvS
	Jwe6wvkLeVIm3NtFcTLQ1P6pmHc6e6QBBVcmVqwmt7a0jEb1E0KGkpaz1TUAB/S1tty5ov39Xd0
	whNCA1gcdrtD0g+u8OyojzxhOqjWtJCEZzSkDqkp8hpNk1tHapRs7oxqxHZTQgDOqrRoaK6OJhP
	t8v2uNtm7PFbUkYB
X-Received: by 2002:a05:600c:a6aa:b0:488:a9c3:44a3 with SMTP id
 5b1f17b1804b1-488fb881cacmr183991145e9.2.1776819908064; Tue, 21 Apr 2026
 18:05:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com>
 <20260420221637.2631478-18-joannelkoong@gmail.com> <CAOQ4uxiKj=+Gcxe87Jpqk_CXm_qrTMpk-OSS4LX1x7ineT3MTw@mail.gmail.com>
In-Reply-To: <CAOQ4uxiKj=+Gcxe87Jpqk_CXm_qrTMpk-OSS4LX1x7ineT3MTw@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 21 Apr 2026 18:04:56 -0700
X-Gm-Features: AQROBzD2rgNsSoKu-fdl85q6ICUE0HWqCdiJ6kN2au_N11d_nWKdwORP7Gw-vU4
Message-ID: <CAJnrk1aU0_VoqaDgZ9gz=2mxKasfL0HyJXt2aUm9A3CVimAV4A@mail.gmail.com>
Subject: Re: [PATCH v1 17/17] docs: fuse: document extended passthrough (FUSE_PASSTHROUGH_INO)
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, luis@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 4:09=E2=80=AFAM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Tue, Apr 21, 2026 at 12:19=E2=80=AFAM Joanne Koong <joannelkoong@gmail=
.com> wrote:
> >
> > Add section about extended passthrough (FUSE_PASSTHROUGH_INO) mode.
> >
> > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > ---
> >  .../filesystems/fuse/fuse-passthrough.rst     | 131 ++++++++++++++++++
> >  1 file changed, 131 insertions(+)
> >
> > diff --git a/Documentation/filesystems/fuse/fuse-passthrough.rst b/Docu=
mentation/filesystems/fuse/fuse-passthrough.rst
> > index 2b0e7c2da54a..c7ccea597324 100644
> > --- a/Documentation/filesystems/fuse/fuse-passthrough.rst
> > +++ b/Documentation/filesystems/fuse/fuse-passthrough.rst
> > @@ -25,6 +25,12 @@ operations.
> >  Currently, passthrough is supported for operations like ``read(2)``/``=
write(2)``
> >  (via ``read_iter``/``write_iter``), ``splice(2)``, and ``mmap(2)``.
> >
> > +With the extended ``FUSE_PASSTHROUGH_INO`` mode, passthrough is also s=
upported
> > +for inode operations (getattr, setattr), directory operations (readdir=
), and
> > +kernel-initiated open (bypassing ``FUSE_OPEN``). In this mode, a backi=
ng file
> > +can be attached to a fuse inode for its entire lifetime, not just whil=
e a file
> > +is open.
> > +
> >  Enabling Passthrough
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > @@ -46,6 +52,131 @@ To use FUSE passthrough:
> >       the ``backing_id`` to release the kernel's reference to the backi=
ng file
> >       when it's no longer needed for passthrough setups.
> >
> > +Extended Passthrough (FUSE_PASSTHROUGH_INO)
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +``FUSE_PASSTHROUGH_INO`` is a stricter variant of ``FUSE_PASSTHROUGH``=
 in
> > +which the backing file inode number must match the fuse inode number, =
enforcing
> > +a one-to-one mapping. The kernel offers this flag during ``FUSE_INIT``=
 if
> > +``CONFIG_FUSE_PASSTHROUGH`` is enabled and the architecture has 64-bit
> > +``ino_t``. The server accepts by returning it back in the init reply.
> > +
> > +Enabling Extended Passthrough
> > +-----------------------------
> > +
> > +To use extended passthrough:
> > +
> > +  1. Follow steps 1-2 from `Enabling Passthrough`_ above. The server m=
ust
> > +     also negotiate the ``FUSE_PASSTHROUGH_INO`` capability during
> > +     ``FUSE_INIT``.
> > +  2. When registering a backing file via ``FUSE_DEV_IOC_BACKING_OPEN``=
, set
> > +     the ``ops_mask`` field in ``struct fuse_backing_map`` to declare =
which
> > +     operations should be passed through. At minimum,
> > +     ``FUSE_PASSTHROUGH_OP_GETATTR`` must be set for any inode-level
> > +     passthrough.
> > +  3. When handling a ``LOOKUP``, ``CREATE``, ``MKNOD``, ``MKDIR``,
> > +     ``SYMLINK``, or ``LINK`` request, the server responds with a
> > +     ``fuse_entry2_out`` (instead of ``fuse_entry_out``). To enable
> > +     passthrough on the inode, set ``backing_id`` to the id returned b=
y
> > +     ``FUSE_DEV_IOC_BACKING_OPEN``. Set ``backing_id`` to 0 for inodes
> > +     that should not use passthrough. The ``nodeid`` in the response m=
ust
> > +     be the backing file's inode number (``i_ino``). If they don't mat=
ch,
> > +     the kernel rejects the passthrough setup with ``-EIO``.
> > +  4. For passthrough open (``FUSE_PASSTHROUGH_OP_OPEN`` in ``ops_mask`=
`),
> > +     no further action is needed. The kernel will open the backing fil=
e
> > +     directly without sending ``FUSE_OPEN`` / ``FUSE_OPENDIR`` to the
> > +     server. ``FUSE_RELEASE`` / ``FUSE_RELEASEDIR`` is also skipped.
> > +  5. For server-initiated passthrough open (without
> > +     ``FUSE_PASSTHROUGH_OP_OPEN``), the server handles ``FUSE_OPEN`` /
> > +     ``FUSE_OPENDIR`` as before and returns ``FOPEN_PASSTHROUGH`` with=
 the
> > +     ``backing_id`` in the open response. A ``backing_id`` is required=
 even
> > +     if the inode already has passthrough set up from lookup. The serv=
er
> > +     must use the same ``backing_id``. If the inode has passthrough,
> > +     the server must set ``FOPEN_PASSTHROUGH`` or ``FOPEN_DIRECT_IO``
>
> IIUC (and please do double check this), the server MUST always set
> ``FOPEN_PASSTHROUGH`` if inode is in passthrough mode and it MAY set
> ``FOPEN_DIRECT_IO`` *additionally* to opt-out of passthrough when inode
> is already in passthrough mode.
>

Yes, you're correct. I'll change this to "must set
``FOPEN_PASSTHROUGH`` (and optionally ``FOPEN_DIRECT_IO``) on open as
cached..."

I'll add a separate section about the hybrid FOPEN_PASSTHROUGH |
FOPEN_DIRECT_IO mode to make it more clear that direct io supersedes
passthrough for read/write but not mmap.

Thanks,
Joanne
