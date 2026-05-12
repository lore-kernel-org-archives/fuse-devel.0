Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07973CC7F8
	for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 21:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778620062; cv=pass; b=Ow01R6ZOa3prtbo7CSoyNyY+ejYe2bP5ConwUohqe+PFwy8UXF3L0m/glxCHeqNISCT0U6+jwFTUHZHbPJsCOePglqbPkc4a8TA5xWZ0oNXyxxT/CPIifGRJuo88XiTR4T4sGt5sYfxpD9HEUHgneVlY6sjRfMOEWb/mqm1VmwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778620062; c=relaxed/simple;
	bh=Np6WGxv9zWdDl93A8vQaAShlHx+p31/wJM4yu89+h8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TunxPYbiTIet2wnlW24VOnk1yiQ5rQCKLzzNPs4IknLmKsg6k3oQaw4Kf+L4i6WbTWzes8/3LTzUf0MIj+41ClrjOppXvgRziQ/BnTANreM47NWzXBD+KdOLzS/fcorjYvy8fUtoISRYMrLTl9yvYLpnVIo/cR2W0oVxolk2AdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edXH9nEZ; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edXH9nEZ"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67c1e0229acso9285765a12.1
        for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 14:07:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778620059; cv=none;
        d=google.com; s=arc-20240605;
        b=BjFVqeD4Kii+pqr8dK/4b2kpdFrG75JHhvnFyv+zPxrqS/JEdMCmK2P/dxPRnezXZs
         l8mTHW3G0sU6d6HDV+mAJ+nuRkJxKYT0/MewVbp6xWUTKrTMcT8wmg/zcdpb3V6iCIdw
         EWEYFwikJ8EnOGSVJI90xzI4nzVntmgcjRfSr87iWE/68lHZ3KHeqtLLxNLkOujtbC9H
         0F47Cg7SBShtEdD9xVJjaUtH+yIvfLcyXC0Ix8hWgif2axeM02FZ0X4KUOzZM/SW2GbI
         JO7Ks+LHjo3fXvvtxCxT1X4dLYE7SgTqYRUmdrBI/ApAKNqaaWXJ7nn4F9etRYaBV9Bo
         nhMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2j2E+ZMhCPeb8oU2A+69RVueY5y8n7R8izOZ6b0UaH4=;
        fh=8sbOQMbbMS5xNcuv0Yzam3X1T0bSs0tQrUgqXJvNoIg=;
        b=Lpa6nKg22Fk5M3QxDn35MSPSBsXHFG79jKowJpwme3z831YFZsLXkXe0rAj3HEpAiK
         r4ggdP4fyaipUgTZhg8baeQ42EIMvnaREXRGcQfR5x2qPshi3f1RkPn/327USWr/GVn2
         CBj+ex1o2uyVORBd5fU42lC+WzM/xqi+SfXgPdmKM7qpzifvchIhr4Rvn4uByzBec8rJ
         mGYSpQFzZZU9kc9+RffEQvhF5rxFoYrZdndrim/KzabxnBNgnl5CfEMnJQd9XqIr612t
         sYHQmT+HXTqLnZ8nOD3+jdViIlti0X5vs3R3wSbboJabW8tU2oK4z2c7lAOgonbHg5RI
         EI6Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778620059; x=1779224859; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2j2E+ZMhCPeb8oU2A+69RVueY5y8n7R8izOZ6b0UaH4=;
        b=edXH9nEZNVqX/tRg2SFs9RL6o7JzjIz6KaQrTmy3JGYBNyZ2HxlytHP1y9CDY6v6yB
         st90M+bo6Qr81/d5+s8mzbekmG4pbUD8+YeuPneVUN9yMNqSVHeHLmvxokYClv5h3zE1
         TCxxlqPVuGnz3D/ZOfx+d32FIUGMigbxCe3PXPAymlv3k2JNqxctmEWVxIToBBKzTOXc
         zWVA6JIfC7xX7YzH0xaXBcoOV+KK+UOfcHSDayLLJCkrKQDi8RXbbdh+HfpOiQuqCh0z
         USVPRCTsjuOOo8II4pGOnizjr3XQ676P4B+KYE3T6rxuP5qrsMlsLTRkijjWeXg8DW9O
         MR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778620059; x=1779224859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2j2E+ZMhCPeb8oU2A+69RVueY5y8n7R8izOZ6b0UaH4=;
        b=kyPa3okPqB/BS2W2K52SM2zUJl55jf9BD5mN7ygAtsCUXvK1ufZXqGew8C19qm/AzX
         o2FuyujDO4RhlrvcdYp37ZyG2el6jpLXjiGXZSLbb8hs+e/n4EGJpupcQj4VHkRussZy
         iqreEMne8NgSpWAxa3z3ekDiYh0FFL6uZlx42c24Uh9RbXU/+W5rQV3lGv3Hn3YeJTWV
         RyKqggTT+7qUP2tEOfZisAB5QGU04DKLfXvDgBzWDszUJgMAJkyTYQduRSMFByZbSuD7
         3LBcgQxG9O4yd788fHCThKGaWgWeakuzlQ8rTykTz6fBcfBAm/pnjIbUA3V3PnqIYMy6
         Wwkw==
X-Forwarded-Encrypted: i=1; AFNElJ9XrJoocPnxzIQDDQT68S3coF3KvVCf7vK/bX4yJQzuO1XwUqTVb0XOyXCQC+I+KmDumZIl7pWJnR7Q@lists.linux.dev
X-Gm-Message-State: AOJu0YxA3hPeXcRdycLYVXdnfaLN2RU/mYXwZOXC9wPbyJE96mNj9sWy
	CDxkQbzqpmxOQwDr4CYMx++aUuW2ZfoDzhq6Jmr7FsSMVvGpzj+NHTvK5zz+iaeLLpx61WYQgwo
	WzXAXvS/rEfSCbhhVFDk+l21yOpXBjJU=
X-Gm-Gg: Acq92OEEXWSomGN15oB5Lz1xhdvtkNX8yaylfvmMNPoc3XkJvFYaIHE/JEDcOpLDW0O
	PfpP1OryzG9THHUuKY+3c0lpZ8yE0fd2A+nhW5ZjrjIPPJRfgQFaEeYPvXZNQVFTSUgBso58K2z
	yrDzeMO65LDkXABNnwgUcobB0KhNpxpx7aOcpT/Gv+hxLx3HGLPXEFsQhwZ25689+INaIVZHNxH
	/c7JUyUTqSyolwVAYV5sNgUr8F9tBflLXnfTfWJresamtKgWIhSfc9Ynv862vNcf478QtDW7pcZ
	qfJP8mLJtl/aVSaIGyQKEo04ow172+hQG5ALiPcdeJBpeZfLmcI=
X-Received: by 2002:a05:6402:5356:10b0:67d:5c3d:8633 with SMTP id
 4fb4d7f45d1cf-68257521e4fmr179622a12.26.1778620058910; Tue, 12 May 2026
 14:07:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260429102058.1362965-1-mszeredi@redhat.com> <afxK2HSiwY32KaWw@fedora>
 <CAOQ4uxg-tgCmJkjFAQ86_xB7dDQKGy=geKAcxT2vB8cUSEKdPQ@mail.gmail.com>
 <CAJfpegt7hj=WDKKASjWLVG-R2tGYUKMJ1qR0iv_Y+GaYS0mW4w@mail.gmail.com>
 <CAOQ4uxgoavKU6zNMN9YF5cchvux6CGGxd56BBOJFWX0gkVAChg@mail.gmail.com> <89cb66a2-0f38-4b44-8897-50e932ef6153@bsbernd.com>
In-Reply-To: <89cb66a2-0f38-4b44-8897-50e932ef6153@bsbernd.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 12 May 2026 23:07:26 +0200
X-Gm-Features: AVHnY4KcyyZduQMJTkOOUAxNa4xug0XT0sTlBvMZ7FQIUF8pfK6I9OHQGDZVIm0
Message-ID: <CAOQ4uxj7tZ1gcfRDPTiwgGgDR8DBXpL++=go+AeMOFvUBEjLZA@mail.gmail.com>
Subject: Re: [PATCH] fuse: add fusex filesystem
To: Bernd Schubert <bernd@bsbernd.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, Horst Birthelmer <horst@birthelmer.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 3:46=E2=80=AFPM Bernd Schubert <bernd@bsbernd.com> =
wrote:
>
>
>
> On 5/12/26 15:08, Amir Goldstein wrote:
> > On Tue, May 12, 2026 at 10:18=E2=80=AFAM Miklos Szeredi <miklos@szeredi=
.hu> wrote:
> >>
> >>> I see no reason for fusex to not support lookup by ".", which is
> >>> anyway needed for "reconnect", so a fresh FUSEX_NFS_EXPORT opt-in
> >>> for "re-export to NFS" may make more sense.
> >>
> >> Why add reconnect?  If server supports persistent file handles, and
> >> all req's get the file handle, then no state (nodeid) needs to be
> >> stored by the server.
> >>
> >
> > Yes, we are saying the same thing.
> > What I am saying is that legacy fuse has FUSE_EXPORT_SUPPORT
> > which means server supports lookup of "." which libfuse always enabled
> > and then we added FUSE_NO_EXPORT_SUPPORT to opt-out of nfs export.
> >
> > I am saying that in FUSEX, lookup "." support is implied.
> > And that nfs export should always be opt-in (FUSEX_NFS_EXPORT).
>
> I'm confused here, why do we need lookup of "." without NFS export? And
> which file system actually supports lookup of "."?
> Shouldn't all that be scratched in favor of LOOKUP_HANDLE?

Yes. This is exactly what I meant by lookup "." support is implied.

AFAICT, libfuse sets CAP_EXPORT_SUPPORT unconditionally:

        fuse_set_feature_flag(conn, FUSE_CAP_EXPORT_SUPPORT);

ALL of the high level fuse fs are allowed to be exported by NFS,
which is often a very bad idea.

Thanks,
Amir.
