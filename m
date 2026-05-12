Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D5338228C
	for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 21:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778621312; cv=pass; b=hoq0u0mRNwwmGeyC/aRJZotNtkmOLTtnEgkjxJbdV6DsGTI+asbO8vaSv2r56JOmu4+PQAnl9nas7m6wofTIEkQoVrOT1S3G/Z0uEeC0impRO8SWtwNRvEj+A4iY4nxWkXO+Jd3fQFhi3dDjxP7uXQE/6B4aMnZ4DO992bIBPIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778621312; c=relaxed/simple;
	bh=nTlNsEk0CFiqzdQuPbBiOZNXvOgKfi+6NZO/Edlv8wE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QlJInh571ybMCi414Y+useniVy4HcARj0EXai4NsxwOT6+aoY+whlOQvCEh3JbQM2yhZ5vAXI14pHLqwaPMkoPISsx1mP91plx0QOsipzwAN5khN/ETydUqf5BEH+T7oPoEUKI6Q6KDDJFTqtnAStc6QjtyN8J21uBB6Qffqp90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lF/LN8/e; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lF/LN8/e"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67e24b8ef55so8506559a12.1
        for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 14:28:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778621309; cv=none;
        d=google.com; s=arc-20240605;
        b=c79Sow6nxXT8qJOR1FhmQX1LfTI59UEb7PZh1Y8o3FTdUMOL4cNbsYNRRsJTWpQYyk
         iEoNr4P6PIS+5BcNENpVCu0XPWRRTbZ2pdsyxQgmdhTT9pvgG+gsYN7wP5CKnTmauUEy
         DdyYL9wOpBfoDYb/ynsTyt6Bzt4LCb9BS/FvrfTKqkgLg+VCQFTe3oH56ej2kln0nUEA
         893qI0F0thvQlK9yYARp9WCYfojl1zrz3fKQRWzT6zJqzC8NZmuetzW/JVkUICjGy36D
         YLRrDdOahm37QjkqHk56qmliajRUr8NspnM3ABCkxMqVWd0SSXW89b1hgXqjoowCAp8V
         VniQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dSBPIsvIO46UuO2xJPqVuu2fMYhRVSRYA+smdqfJCdc=;
        fh=SueeHjxZvAPf6Vj19zccRoxuX74ecalWlmSM4bmVyfs=;
        b=XRej5U8pYQ212If34Dhx5hKjrZ9g/UHkug6vQh4B+F3x7lcJdSRAXFMbuwjY9fdqE0
         B+taPSQESjWsy0Oe78hv9c+XfrEbp6sD6FbiQQ0kIspJ4Yd9Uco0WsCNtFNlHQt+SzrV
         dHc5I9LidXPF3RTgjAVLea1Z4OXHngNuCeHD7p0Q7OnL/GJ4KUf68+2dTfwq73av08cz
         SXgiLBfSRQNBoxz+XjoPhEHqL83yqBUiSGNRfbLigHw+9WUEpi7YWWkv/utGH4NB36j9
         4QfPsdarOLI00NaO3uwObXmeHkWnzsxnYiT/g7t00FYtcxVbYt8U/iKvwk6Z+ERJUtzR
         6qCg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778621309; x=1779226109; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dSBPIsvIO46UuO2xJPqVuu2fMYhRVSRYA+smdqfJCdc=;
        b=lF/LN8/ezznHmrV8G3HDaF6klENM83Ov2ujhW5U6P7HxWZZ3RUGxwURTFuv+cQdSoL
         boanmEQUrZ5JzqV4OYzT3UWAVpwcIU0SkYLhfgFNuhLQX7am3PJCMHR5FP5wsp/kc8di
         AZJEkHM2O8GbwFcbYFBDnI89HNfoHWvVKKHm3l5RKDGJuTkA8G3dm/Sshc7cGpCzAiIt
         GAUF4OeMnFFyEcswkpXDoaNRUiuCBoeaYn2ZcoLnb4s45EaduRbrX9T7GAHb+N1LBeJE
         Iw0fBa7VaL4UW3E5+DplPpFAts5JdJPAuqRku5klBJipF0hVJKDExbqDvClDYpVNLaWa
         rK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778621309; x=1779226109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dSBPIsvIO46UuO2xJPqVuu2fMYhRVSRYA+smdqfJCdc=;
        b=pY3DcsmR/0TSTtgPtW/ooct7g7e0rQX9ijWdTROQtdiEbnFmXm1sS70m5xQ8DEwVTY
         8UBQcpZdvIYhNQ6p7GQzKENoEDceyzK+Xs6K1B/z9stVQYeUXLLihLpjIx0lgXEbl7ZK
         MmI/XN1/krakUyG/jfak9Y/on7Cb5f00QNXjXpEDA+DadfDIh4WPi/M72HAzgEqUxMHT
         +5IhEkKwAhYOu38PoIGi5burEiyyOv7FlFd9KC8C0cXSf8an/hwK2ixxzSOIF1N5dkXA
         iL0x9WidaWV5XRjxMY9NHKv8iFJWl0ZgtPc94Rkap5LKWWVhSOCiJP2NtYHXvYUJExMv
         ifEQ==
X-Forwarded-Encrypted: i=1; AFNElJ9dw/kb/DEI9/3o/9k04k+2zBE8V3DtsQNbraC175W/UzFhHwBebCquLTlIH+TVpjjKfbKRphBAtOFq@lists.linux.dev
X-Gm-Message-State: AOJu0YzekrrL/UWSjZ6ydieCUMby1aqca4CgFOzXyAoHNH+vL0hGGN0z
	RrK8l5pg2xsWl1GH3249j7qxG608EmGixiHyXkVNfScLdEjUkqYPCPKkwBLvg+HoVHRWFaCZXGQ
	gmLq0CJwDzqF9nzkGnA62WBs38s4OB7qtesKJ
X-Gm-Gg: Acq92OHKQVO/AvgO5V3zOrXsdjcQAQPEEpbjxPjexn2xe1xhosyO609oT/TdDrPWns8
	Pnp1OG3pv0QSasHMBPV5LtveaLuP/Gw3ATVtu+cOk5aTyqB4RUjZmmMdjPuXn5GVJI71FSS0mLE
	hHV5lsOXxrA+KJLhmyRMHXZXmmDkfUdBlEN4GRfJUpF/bNO6Iv5qDohSXWs+eHAJ4rzCQdIAXN7
	Js6YsUWH2+dTTs4V29UlhlEbJZY3XAM3eybX1gBP6L6L9kkdjua1CHxF43R5YxL065Js6OJ2Gb5
	rbJL274qYQqRIwiip5Y0lqjCwKKCy3cHcS+EvNaBX1qoxPcFJ5E=
X-Received: by 2002:a05:6402:14d0:b0:67d:6c95:9c8e with SMTP id
 4fb4d7f45d1cf-68256c5fe08mr179714a12.14.1778621308692; Tue, 12 May 2026
 14:28:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260429102058.1362965-1-mszeredi@redhat.com> <CAJnrk1Z_JWtuA3UjucF9=YH63AH_-J_0hzr9jbY99Hx3O8YrAw@mail.gmail.com>
 <CAJfpegspraqMp1Z3mi_csiw6haawZPa4zWheSUN7MhBy47aYKQ@mail.gmail.com>
 <CAOQ4uxgV4_Pet0w3f+Sq4kLkvgKM6FyJwZ4AQsnvctC3w=dP6g@mail.gmail.com> <CAJnrk1ZvB-R3Szn-VxOZvPRgX_dXwMLouBphnT9_URCE8SxTvQ@mail.gmail.com>
In-Reply-To: <CAJnrk1ZvB-R3Szn-VxOZvPRgX_dXwMLouBphnT9_URCE8SxTvQ@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 12 May 2026 23:28:17 +0200
X-Gm-Features: AVHnY4JCKqR4Am3jpmEEFUByOw47vYGALvukQFW2hpxx-rR9T8MkMf8cNVEBhEI
Message-ID: <CAOQ4uxidwSn69A08Urue7S7n8wrGQcyGuvRL387pD+rpSFP-Ew@mail.gmail.com>
Subject: Re: [PATCH] fuse: add fusex filesystem
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 9:22=E2=80=AFPM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> On Tue, May 12, 2026 at 6:22=E2=80=AFAM Amir Goldstein <amir73il@gmail.co=
m> wrote:
> >
> > On Tue, May 12, 2026 at 11:31=E2=80=AFAM Miklos Szeredi <miklos@szeredi=
.hu> wrote:
> > >
> > > > * in passthrough: backing_fd passed at lookup/creation time only (n=
ot
> > > > at open time), expanded struct fuse_backing_map
> > >
> > > Yes, this needs discussion.  Amir may have additional info on this.
> > >
> >
> > Having the two different lifecycles (open-to-close, lookup-to-forget)
> > is by design.
> >
> > This allows the server to potentially move files from passthrough mode
> > to caching mode and vice versa, as long as all fds are closed.
>
> I'm unsure how useful mode switching is between caching and
> passthrough because the server has no control over when the client
> application closes all its fds (eg it can only react but not trigger
> it).

This is debatable.
My passthrough fs server coordinates state changes with HSM
using flock on open files.

Previous implementations used to allow using cached mode
until the file content is fully downloaded, which could be beneficial
when streaming large media files.

Current implementation uses the DIO or PASSTHROUGH modes.
I have not yet collected enough real world stats to know if this is
a problem for large media files streaming, so would prefer to keep
the options open for now and I see no reason to deprecate the
open-to-close lifecycle. I don't think is adds that much complexity
to the code (?).

> For my internal use case of switching on passthrough, I was
> envisioning the server handling everything through direct io until
> passthrough is possible (eg the remote file has been fully downloaded
> over the network) so that passthrough can be switched on even with the
> application having open fds.
>

Indeed, being able to switch to passthrough for new fds is a big win,
which is why I also changed to this method in the current implementation.

> >
> > Adding inode passthrough ops does not play well with this mode
> > this is why it requires the lookup-to-forget lifecycle, but I see no re=
ason
> > kill the open-to-close lifecycle as it seems useful for servers that
> > mostly care about I/O passthrough.
> >
> > w.r.t expanded struct fuse_backing_map, at the moment it does not
> > sound right to me to map a backing id X with more than a single backing
> > file or device.
>
> My thinking with the struct fuse_backing_map expansion was that future
> ioctls for managing backing files (eg attaching a backing file to a
> live inode or swapping one backing file for another) might benefit
> from a shared struct instead of needing to add new structs for each
> type.
>
> >
> > I think that the maps of fuse_file to multiple fuse_backing is better
> > handled by another layer of mapping (sort of a backing_mapper)
> > which is what famfs and iomap need, but it is just my initial thoughts.
>
> I like this idea a lot, it makes sense to me.
>
> >
> >  Joanne, if you are a concrete use case for that, let's try to see
> > how a design to this use case may look like.
>
> The internal team I'm working with is planning to start working on
> their server in H2. They will run some benchmarks to see if current
> passthrough and/or io-uring+zero-copy might get them the performance
> gains they need, or whether they will still need the set of advanced
> passthrough features they requested. I'll keep you posted once there's
> performance data and if there is still a need for the more advanced
> passthrough features (file mapping to multiple backing files, backing
> files dynamically changing, enabling passthrough on a live inode),
> I'll draft up a design doc to get your thoughts on.

Sounds good.
FYI, some of those issues we try to solve at application layer.
Our HSM application always tries to keep the inode itself across
state changes.
For example, by using clone_file_range() to fill in content.
With xfs, we could also try to use atomic swap extents, if file content
can change, instead of changing inode, but we did not try this yet.

> In the meantime,
> I'm planning to send out v2 of the inode metadata passthrough patchset
> sometime this week or next with your feedback from v1.
>

Cool. Let's get this rolling.
I need to get my test setup back in shape.
There were a bunch of fstest failing last time I tested passthrough,
mostly related to metadata cache coherency.
I was hoping that GETATTR passthrough could solve some of them.
If you have seen any improvements (or regressions) in fstests please
share this info with the patch set.

Thanks,
Amir.
