Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3FC30148B
	for <fuse-devel@lists.linux.dev>; Wed,  3 Jun 2026 15:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780499283; cv=pass; b=G0sk9rpZbAHuc4pkSP60R+S2VgHTawMh3rjzwCMY/LY28Y2k8CrJCP/15ehnf7ht0xFO1yA8KWjn8rwEr3VWKhYNCwAVw5UDLXtT5P885au7fBXkJ+UGZFq+pGuy/GUuSD4/6ELSyDVozZbdgbskJAD0DFqUL/flPu2uisxtaYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780499283; c=relaxed/simple;
	bh=P/B3fTsIY6mgH6AUlb7QIPoukQwuOxRQhZie38HzHtc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PK+uE5hoqr0Mxyptx9sX94bLch1KDNqeRw4jihnaEQrcEOObOj5VvGd9R+KoCoSK8lc7qNCLhAO5xfrBmGLRUmqBmTM8zVaeMrv153j5OK3GHQk50j7wzYN2y61iVOxh8yqYYU0wu26qH+oTiBAdJtlhAUAPldfa+DDP9xeZyXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLp4tCFt; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLp4tCFt"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-68e5f7c1131so2340322a12.2
        for <fuse-devel@lists.linux.dev>; Wed, 03 Jun 2026 08:08:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780499281; cv=none;
        d=google.com; s=arc-20240605;
        b=lhv3B5j+cSV0hDifjCKu5T2/SWLOklWX+M39+ovLqa/pdK+W0/g0nibXuAH5/PcP8L
         /i7ihatYBhJiyfzgOBP86GvEENgLygWMh/5yENSxnLu+tNbHj7JQ5eKObjJiClnG8ZLd
         qVvYJzunVAq8i4RgJ0KvC1FDY9yWSP665OCQviPvDboOV7J78VSAl+Zd6MkcgaAnEVzi
         nMG9y/O7NZ3pksRW5hpp/P8H2IC6YqEmBrueIkxkVcLvi10yKHhZFFqwY0wz7mkiArGA
         EF4m66s/pPEAqdvNO2py+3I8wLkDUMqDALGHThmk1XC0YtfSTYhbYVmOocWvLi1DohrV
         cpNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1fkZpD0bOCT72HD9WfDQ/7mv+dhTcnXDkJ/NDkZB7aY=;
        fh=BfmIGGG6oZqRrloKr8vXs+nx23iIxg155ufuToOZ2M0=;
        b=TCVq2WgtZAC77ov9BOX/PiYSjyes37BLqsHgYaiu/eo7kik2U99gvyZpsDbFizDGT9
         NsYr1oYY+CLZ7gfRICV6nTMbmykkUJQXhPxYK9Z5J0zjoisKnZQ4LrLld2+NADcaINO3
         4G0vs/GYOVov/T2SRdY2Q6m8bEkdrSdb27nRawi07LykqIJR8cK78uoczSluxhyv/V7r
         Y4g+I21956gcG252aZ/IitWt6wyTw8vXYYE+LNYtWK86pOx1P8P0K5JwIQq0WG0vAOGT
         eTj7g9ZhSdH8/NwZqnvHOexeiI13FYMinGWUn13YOQ90G/X/6AeiTATLOM5tgpI/oYem
         v5iQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780499281; x=1781104081; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1fkZpD0bOCT72HD9WfDQ/7mv+dhTcnXDkJ/NDkZB7aY=;
        b=FLp4tCFtNA1IeqG6iNXGMxWtKI6o5cnssJiPt2+yz/61BRU1tv8qauuKkmcbbOx7h9
         S1F68b10IbocSj+c15bKzCcifuAZDmEjXawphPVoKv31U/yUnOCgfBDYYIvtO1HdjdFd
         NHRteJGithRNH7Zq7KzhoI2t4RorFNWAdh/uIoAzaNPwSKGXTeMOJuUCp6vd/S2TLN5E
         8dv1alWGTWW5OtVKQ3DZcd0FlAOxbWUWCs8j02sL5sDGdnJ5BLzupNjPJQ9BeDOSC7xG
         aLKMc7AGz2TanDmOTCG0D324SrJHhI0nj1sqPDm9l9XKI7Jwt3dkxKSX/1fPFmpYIN0O
         h2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780499281; x=1781104081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1fkZpD0bOCT72HD9WfDQ/7mv+dhTcnXDkJ/NDkZB7aY=;
        b=UeZOc4SJKY9tPxcPcGtwOlRPhLrN3W+EoR8DMwzjVpj+6xBvIYEiqEF9dIXARqWqRD
         jHbuo1L0LGbOgt7lmqT+V6P9OvLiwMdnTIVf+ULmnTFz0AMdQ5H9EJTw4YbAF9rH5Lts
         IJpcUm4TGcS/XgNqdkNf1YX0RFntnxOrN0TZgWpM8EN9LPfymUK0r6FWIISRkYjUoiUq
         jtYuEYCe38zwaZXSVr3SCwDTP4aoOMlTo6E4T6BDWAZWJ3XjVesIELukSHNEhMmuMxMI
         ft9Hy5z99ZoVxTsJxQwRr8LF+gwcuOMKPrgyVJ3xt2BgSeJn59kX6eiOWEpIh1fuDclU
         SKCA==
X-Forwarded-Encrypted: i=1; AFNElJ9qIX7mxApNUoQksxr9x+PoY91fMGlqgC2DOP3WUWcIU/Opm7Q0Y9J7D0JGJC7NU3Ws4gzBGXpRwXad@lists.linux.dev
X-Gm-Message-State: AOJu0YyEQLpyY6tocOtuh+3toaPtt8zxQ4h2QlB0xhatXFI7TO4Jlgdi
	OFZ0faFfSxrbGrdqC7f1SIOq8IsQDMgo+VU4liaK5CkV6oewS5yPP4YxEmhqKK2C963u9NZIhwj
	QsQsBfDRLaurPkrsy/Vdu6ATzIr7CcpM=
X-Gm-Gg: Acq92OELDrlzQMXnveGPCz12wNf+IjQZy4rpUUwvjbTTFp8Bli84LfDffBe2MAEO36y
	V+7OFkTQTAbJ+MSttZA0SxcJqTsqis+2M9ChqEnveypxpA4rN00a9Di9utPEgRI0dUtjSIuhkbc
	m3MDpfO35b3K/A3PsYtesQvki+gr069OkJN2eIS30BaKFkqsmpmra3dmor0m6FytDWH/xow19MV
	UZowGrS4ZcfjX9qVGCBjCNKkU62tDVnEq98ZdfENgohRIIsnDDUzuIA9p3k905vMGWZxNi0ydNK
	I28L0/dFCsviogueZ4eCMO0K0ZwvL5KWlrSfoBPYi7jrMsR0Xf1DbOjSRMep/zA=
X-Received: by 2002:a05:6402:2681:b0:683:93a2:dfb9 with SMTP id
 4fb4d7f45d1cf-68e6f2cbeecmr2025656a12.1.1780499280444; Wed, 03 Jun 2026
 08:08:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260601212414.1154139-1-amir73il@gmail.com> <CAJnrk1YGSrEkP2O-JPpie1zqc_5tBH9uHFvMry18TBdCMytNKA@mail.gmail.com>
 <CAOQ4uxjCTCo2SQcuVWt+E-BapjrHWBcqES2PQOcwDFZ+2KgXFw@mail.gmail.com> <CAJnrk1auhoGN729ptGN4aF0akoMd+oKebBcK_2QNaaoyu8vbzA@mail.gmail.com>
In-Reply-To: <CAJnrk1auhoGN729ptGN4aF0akoMd+oKebBcK_2QNaaoyu8vbzA@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 3 Jun 2026 17:07:48 +0200
X-Gm-Features: AVHnY4IOi_WMnGobyP8_M-YPECprdGQacNx5fYE--aaihQfvOErFBm6VaxNL1DE
Message-ID: <CAOQ4uxgR=1pgovTY2Y3s3jfaLkuyDspm9AFk0XpDnbJ3uv5cjw@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: add fuse_request_sent tracepoint
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Bernd Schubert <bernd.schubert@fastmail.fm>, 
	"Darrick J . Wong" <djwong@kernel.org>, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 7:27=E2=80=AFPM Joanne Koong <joannelkoong@gmail.com=
> wrote:
>
> On Tue, Jun 2, 2026 at 6:32=E2=80=AFAM Amir Goldstein <amir73il@gmail.com=
> wrote:
> >
> > On Mon, Jun 1, 2026 at 11:55=E2=80=AFPM Joanne Koong <joannelkoong@gmai=
l.com> wrote:
> > >
> > > On Mon, Jun 1, 2026 at 2:24=E2=80=AFPM Amir Goldstein <amir73il@gmail=
.com> wrote:
> > > >
> > > > This new tracepoint complements the existing fuse_request_send (enq=
ueue)
> > > > and fuse_request_end (completion) with a tracepoint at the transiti=
on
> > > > of the request from the fiq->pending queue to the FR_SENT state.
>
> nit: the io-uring path doesn't have a fiq->pending queue, so maybe
> better to just not mention fiq->pending here. perhaps the wording
> below for "when a daemon thread reads the request" could be made more
> generalized as well

Fair enough, how about:

 This new tracepoint complements fuse_request_send (enqueue) and
 fuse_request_end (completion).  It fires after the request has been
 successfully copied to the daemon's buffer, just before the daemon
 can start to process it.

>
> > > >
> > > > The fuse_request_sent fires when a daemon thread reads the request.
> > > > The fuse_request_sent does not fire if daemon fails to read the req=
uest.
> > > > It also does not fire for forgets and NOTIFY_REPLY, which also do n=
ot
> > > > trigger the _send and _end tracepoints.
>
> btw, from what I see, the _send and _end tracepoints do get triggered
> by NOTIFY_REPLY

Doh! I meant that forgets do not trigger the old tracepoints.

FUSE_NOTIFY_REPLY is awkward, because it triggers _end right where
the "normal direction" requests trigger to _sent tracepoint would be and fw=
iw
FUSE_NOTIFY_REPLY does not set the FR_SENT flag.
Having these two tracepoints (_sent and _end) with the same timestamp and p=
id
do not add much value to tracing tools IMO.

So I could rephrase this:

 fuse_request_sent does not fire if the copy of the request fails.
 It also does not fire for NOTIFY_REPLY, which fires the _end tracepoint
 at the end of copy.

...
> > I had not considered measuring the copy time at all.
> > My workloads are dealing with other orders of magnitude for serving
> > time when serving non-passthrough files from the cloud.
> >
> > So for my purpose the placing of the tracepoint _sent at this location
> > is a good fit.
>
> Gotcha, that makes sense to me, thanks for the details.
>
> Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
>


Here is the recap of amended commit message if you wish to
reaffirm your RVB:

    fuse: add fuse_request_sent tracepoint

    This new tracepoint complements fuse_request_send (enqueue) and
    fuse_request_end (completion).  It fires after the request has been
    successfully copied to the daemon's buffer, just before the daemon
    can start to process it.

    fuse_request_sent does not fire if the copy of the request fails.
    It also does not fire for NOTIFY_REPLY, which fires the _end tracepoint
    at the end of copy.

    This is needed for tools tracking the in-flight state of user initiated
    fuse requests.


Thanks for the review!
Amir.
