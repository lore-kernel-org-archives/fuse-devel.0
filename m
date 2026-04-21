Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8409E3C3BE0
	for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 14:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776781947; cv=pass; b=rd72iHAGCm9zhmtUeBxjSP9waefpoDDdiJURzScwxjSxcw9aCaeb+k1pt+GaIaIZpGBhSQI/SPtitIIm+Q3g7WBICnkHgVb2yrhFdWvWCyE4M1IHBIHXW3KM+ExGpvO3gSSmHki/aeMgH9T3dIRIobgT/67VuluKwFDpiZldwIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776781947; c=relaxed/simple;
	bh=4jUKVwn9NNKpvEyYGOMl5JsDSiSJmCttD7DqvBLENhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jLHFUXLk5VsLqc9r0JRC4057SCFLs/eCq0KB6ZwtFqWNj+ukH8UfYNJ9ktZD8Wgyi7n55/3XVSmu3IL9A+ORA/p2iha3QKfKvYzKgqUHz7tie1ITnkseY/NUiptVUqKDtFbrbyG9tuTbA5/OP9rgqzdQXAvru3XdeaNJ3lieybk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P1/tl5GZ; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P1/tl5GZ"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-676d8587b8eso530312a12.3
        for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 07:32:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776781945; cv=none;
        d=google.com; s=arc-20240605;
        b=fXLQcBU3cDrnDjGmWyQ5JMD7lHanyVxJ64AY8ZnTRPDtV8ZLDvzCjucbKO4ccxpkdj
         ICWvhFPhVCXwXyl5WcAx0mWfqgmnGvvNfk6U7tjSXjgqAwqXHe4wrmBuVYE2O6EKr9xf
         7bFPDIzvw3EWzlresyp7D0kQdGt6FRDCpXv0kCtmg5L+jrCjzn8zuF1jG647GectF737
         fhFxBbcyYmLo9qrsc9LiuA6mnYJ3AaAY5s4Kh4klHQnXvJ5IpYdmhqm2GtG7PAPvYluE
         vEm1L/ZGDV+ZlNdJv5w+CuIE1TUdp9rjsSKAl46FJ0Fri4d0eZR98mhuUrDjEklhvLGO
         rgRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rrwCqhWyDPXEAPR+HW31zVUJC8HFMzru8Bvnla45EUQ=;
        fh=0RmlzxSCKEWjlnN5ejn3Nw0st5N1dBiS40EGIVPQPPs=;
        b=AWNBCBrKU7c3iFYhMXFTgGuWqr3R8N0OSoahif0q9COOqfCDqMLw8hsQG6ZP7JOmqH
         QGo5JqZhOLcNsJKs3YGhqtLqtGaPNN1Bu+mxtaOtQx9OWsUzGZMNGzJ3O9mFSKcxR7z+
         x382/twuIVzRcKE433X4ooqkb7IE+A4mHKYtuivslJOgGq3SX4pXHU3rTjeg2gn0I+E/
         3K3+hlesSmo+zzLbwMhNkS2bE9uBdO6v88y0+Cqszrt9e7p/5JH+7fFQNn7TDdGtgz/r
         TfVV+xuX3oMIeaE8w2klK6XXtFXixzYcreoBDRwMMu30qOf64QN4feja/cuWrgLdapNt
         QcEg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776781945; x=1777386745; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rrwCqhWyDPXEAPR+HW31zVUJC8HFMzru8Bvnla45EUQ=;
        b=P1/tl5GZSca4TD9RFYx2w70RFvgOGppR9aUQA5Zwk9MZ1Hh67NTAY2qHu1Z26TlCuB
         YNVRYjfb2zPwzjXIupSK+yY2eaCNaactV4Og4tL6NBcdbLppqAhxlUnwUXvGBHNTsBx4
         Qe+vyGFmg8swPrIcdV9IgshbbxreCoUBLDJuaRQF/TQTKYhqln+tO2DhHEamyCEjWW+f
         Ck6o4PINlI+iKqYqoMollGAR00lkr2BrDXthcnPCnQLo3g067w9jDw3RbSEcwRHuWrgr
         uv04kjH7O7r49z4DzuOSjEGg6y+sMvqZBi9rZwnhCUFiaVi/eJ+vAV1DDju7Gwk2wbAO
         Rzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776781945; x=1777386745;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrwCqhWyDPXEAPR+HW31zVUJC8HFMzru8Bvnla45EUQ=;
        b=fM1JWPkQ3SMz0tOWnX/jOTKjKbHH06yuSGounqX4qiYgTuD0KwsRXE3cK1jzfI5mVE
         dmfhE4TYejDox16s1FTjwcQ4ulqffipZTsz10zA/Bdufvm23wBhYLOYyE3OcKknVcHql
         pt8WEeo7qJnUNo0TXa8neTkJjosD+R/MloEWIl3W63EVo9Slxh7wb7099AmCMA9VyADE
         pORC5hFxOoV2+agKyxS1EHJCMZEZ9f0gu8wpQdTUsQd+Q1a/4gJoFU1kers0L68jHapg
         C90g8JRA1FBZ0ubtd5bHTf7iI5EVQ+EHjvgcQ2ejeypYYzEXPr20IlTnBmYu+4FSeehw
         R/CA==
X-Forwarded-Encrypted: i=1; AFNElJ9QZE37f7nSBYQp4cIYWCjeUG4I+fwrG6Ov6+a7qfsaoCBejutMziEhtEEod3r4hFuVMRVbSGcdTso1@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9QxT2y7lCdW4m2ZWQU/7QrMNSCDRfx6W6+g19f7ptT6McMBjo
	UgA3sjBkKWdn/5+Meilivvyuh3FW0FVzSQeE/XAhO8JVSPxMTqodzKt1DX9hz/GIbUyiYhYCkyh
	lmVuRIzmidj+Gk1Th8AfRhLeVbyiB85E=
X-Gm-Gg: AeBDiet8p9mtfUZhzcqbi9y6ye8vfnNKjWKvlky28VFLCTVX9tSi0Z/wZUpnZWqeUcH
	OmE/L4aHuaKMCS31w4+s5GMxQRvzz5K9NfcdS/Ap4z0kYEJQj6za60RH3Lzadl8y8nw5A2kaYFe
	x2lOYt2YwC1ZpYXTqr8DuhkfJn85EkHeEqfVh8FkDPETW9nng/xNf8KmbcxCdVts7GJSkbLvMa5
	BnZUv9kc9OiPy5QfMqJd4x3Q56GGPu5trYz30+E299hdmx8yYlWgru7TbPhOUizt4M8k6cnTw8A
	y3tWvIpK38/ITc2c08KKcn6vXP0orTRlhOmuOP/MVpm0LpByz67F
X-Received: by 2002:a05:6402:518b:b0:672:7555:9a63 with SMTP id
 4fb4d7f45d1cf-672bfd957c7mr7904356a12.9.1776781944694; Tue, 21 Apr 2026
 07:32:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com>
 <20260420221637.2631478-16-joannelkoong@gmail.com> <CAOQ4uxi3VML0ZcbnCWuzsi2U-N88xU3dJ6S7030oA_7G+A0GGg@mail.gmail.com>
In-Reply-To: <CAOQ4uxi3VML0ZcbnCWuzsi2U-N88xU3dJ6S7030oA_7G+A0GGg@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 21 Apr 2026 16:32:12 +0200
X-Gm-Features: AQROBzBI4UhLyjUCfaWBGEqD9dQ-NhKUZEAalHHfFRqKsMpeR3c0j9L20aAOfkM
Message-ID: <CAOQ4uxjRsO3N_eboyY0R4jMva1jNKsKBVvbO=19Sy5r84D7RLg@mail.gmail.com>
Subject: Re: [PATCH v1 15/17] fuse: add passthrough setattr
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, luis@igalia.com
Content-Type: text/plain; charset="UTF-8"

> > +int fuse_passthrough_setattr(struct inode *inode, struct iattr *attr)
> > +{
> > +       struct fuse_conn *fc = get_fuse_conn(inode);
> > +       struct fuse_inode *fi = get_fuse_inode(inode);
> > +       struct fuse_backing *fb = fuse_inode_passthrough(fi);
> > +       const struct cred *old_cred;
> > +       struct dentry *backing_entry = fb->file->f_path.dentry;
> > +       struct mnt_idmap *backing_idmap = mnt_idmap(fb->file->f_path.mnt);
> > +       int err;
> > +
> > +       old_cred = override_creds(fb->cred);
> > +       inode_lock(d_inode(backing_entry));
> > +       err = notify_change(backing_idmap, backing_entry, attr, NULL);
> > +       inode_unlock(d_inode(backing_entry));
> > +       revert_creds(old_cred);
>
> Looking at ovl_setattr() (overlayfs should be the reference to all
> passthrough ops)
> it looks like mnt_want_write() is missing and possibly many other tweaks
>
> It is generally advisable to keep heavy logic as this in
> fs/backing_file.c helpers,
> which overlayfs and fuse can share, but I did not look to see how much of
> ovl_setattr() is relevant for fuse passthrough.
>

Also setattr is not a file op, so if we move to common code it
should probably be fs/backing_inode.c or something (*).

Thanks,
Amir.

(*) there are a few common helpers in fs/stack.c, but there are out dated
and only used by ecryptfs, so better start a new lib.
