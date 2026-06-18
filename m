Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BDD3290A5
	for <fuse-devel@lists.linux.dev>; Thu, 18 Jun 2026 06:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781764470; cv=pass; b=BqpXazWyCqMsiXcRNUGmJqoRd5mPnWRpgWplcE19VgJzLL7jZ26F1GptbsLr9Nr0gE4O6yTDcLV2/pAHpqW1N7MzJbk63U+C7NNVTyOf5jgjom48zeU1/Bg8RMmUWSiQhmzjIJV96VXn0ic8jg6cHKWQbnWExpggMcGf0r8qrkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781764470; c=relaxed/simple;
	bh=3Oo8NBVlLWLPAiABDvAMPw2Gh1H7ACmqAdcOnRERYcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JcHxRixwyq857pr4H+sFTpNg2r5yFLBFQ3Nhr40Y4U7pNCia1uDWS1O+ls10TDafwuq+RaLB9gA6paKilSzxYlWnfcC5Ap24iAojoBPD3RICk5xvOXhgesQ3q2P0wAkRLhmUSyuAP5RZvMezTJZm1IByDrsKo2YHsgyFP1D3KD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kRXQ1PhT; arc=pass smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kRXQ1PhT"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7e709dd1ab2so255973a34.1
        for <fuse-devel@lists.linux.dev>; Wed, 17 Jun 2026 23:34:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781764468; cv=none;
        d=google.com; s=arc-20240605;
        b=UesZ16Z8BhRNYBQKzBnVnrHcJU2QjoWDXydcc71bNEqFwU2xA71Nvdkf2mnQqvK4FY
         CCpZwRdgIuvzpM5UWcQDaVxt0J6wG82DA6tX8laMPFR3BB7ytbiUoGkrG93stZjvISXj
         tVXemQZ6y5PIvI91i/bLusfqyo59Z4Qh53nz42XmNHcnd3cJE4Q84498Q8AI78ldPVsW
         vBN4SK0yOYgFcM0r5pfjcuhO2wR3L/Qo4X8+W7POzqsFQ35l9p+wBAnACIz1tV0PTBjS
         ltJRSnKyfiiMlQ2SL1wZmocsWBmiklJ3OnNEZ0RPmdUm6aKRqouVfrruX8KsOdK0o3fG
         yVbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3Oo8NBVlLWLPAiABDvAMPw2Gh1H7ACmqAdcOnRERYcA=;
        fh=cHPPhRQdNjHovPZKfkZy/wyHyfSb9cr/+4zlWIrSVlY=;
        b=dJOIGjWmuXVFBvaULLXvEwRS4Q3Np3BKBoKrGOxLawQozvqk0fH1asTt4jtVc5Pgbj
         iWy8KcWqrNxQuOVg2I7MFD6bUDCFga4Pq93I7nxQW8Wp1lyfAmohWVi5Td+mzgL9+S8c
         9KtJC3WiLwQI8ajStNdpuwFnEn6mdvSiIYWC/IwDqVh8prvehLuMiLSvnuaMwQgr0rAy
         E+Dk+CnDxUTzVbAegTzGuWb3p/k6EAbS20TGuFD7ByzOzbCqoTmiaAVerDmzIh8CvOYh
         WyGIV0PhijSQ72Khs+S8L6MYmZKXZ4/bXlhG064AB52UoOH3G1Qr1CNvrzBC+OQxiAM3
         TDgQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781764468; x=1782369268; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Oo8NBVlLWLPAiABDvAMPw2Gh1H7ACmqAdcOnRERYcA=;
        b=kRXQ1PhTg1H707w6ZBJiJkUpTKC6+ayo72wyUrLb8IwMCp6nbOOt1ApZs0fOiYxeqz
         lAb3nLHtzGUSrF4WJ8DqZ77SdrMTDJ5KDeYcp9VgVlTnhCufdpTvoU+0O4SfXRiRoScx
         qRgY1s+lSwUu5sQXKC5qOjDx2rKO8zgR//7q6fnToPZTAaGnh+yKLGRfPlwH+eDY2hMp
         ZRbnWFaX3F3jVllU7dWiIm6bBSE25WsxufoB5YSZ04pRV9bL22cB8Xbni/lOSZcKvPb1
         coiUBRzBspYzhRfDZb5RSCEhJm+l6L+56Fkz79+WP2vHOq8WrvQn7DQOFeq3CDSUI8VC
         gKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781764468; x=1782369268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3Oo8NBVlLWLPAiABDvAMPw2Gh1H7ACmqAdcOnRERYcA=;
        b=rnPisH04sDUGrySuZmSEW4QUVdFbRH+1BxeycbyMNLkfKFzclhTeE1LHvAOG42CLMI
         o1cWyVNsJzCf1BtPVXvzA7I09ZhM6yWu79gkUMVvPgD2HNEjjE4gMXWvg+MR/6t0702q
         oIobtMmuCEUORSiQ69xB9rtyvPw/Rwml8InqJgXCepDz7v0/5bioqidOv/VA8An4CF9v
         PSNgtWJG0hc+SFrfByryjeft6gzUXTsQSgW4cvF5y+FZaOL1mWWcOTJBOFOLOWAlV4J9
         3D9r9Clug9RAGIXHSzkWvfTd9S4nFCkkbWf2edKkqkERqTWtAwshxi55imV9Fkkd5tC9
         T0wA==
X-Forwarded-Encrypted: i=1; AFNElJ97dO+xcE+aEpR7Di9UW4dIn+QfavhCSe/H6hf8/cIP1bbUrHajEJmD4TJkj4Y++qOn+CoZs0+m04Wb@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+XSgA+mxHEtO0BpEQj0bUewKIEhQKTlGBgW9QgkTXcq/PiAf4
	nFi4l8RRDcQ1bE114xB04yVZM2IHssBq4QfgPuF3g3SaaHhmw/To9kGPqMdS/EAmXvwbHHmX7Qp
	bDeIm0G4BnUJAqqTEq9BiyEIM81c9vJo=
X-Gm-Gg: Acq92OHpBmR6oyAFsZLOas9RVyXd5C1jWntHKJ1AJo1O6hKJnITGE/BvWrP2WR0tL2I
	o7j45V0Vrwe+cM6oo0GFooRbyZ52thlubY9V6ZD9prnSAOgBLOsSOmSE54GSe8dkmNJIEPjIrQ4
	Hvgk2Ccb+3nswDNTU9ZkHHmxQm3KHIJ8QHcIKLz57+2uMgNTd8rHfR6pCzqtzmOHmWyr9Wi7idg
	rG7uEHD9o/O9YOMzrpjPuLJsCG0zpBxtZMsVd03cIRT65+9VuhjsMxwSgQVTmSswmYt/LY=
X-Received: by 2002:a05:6830:6d50:b0:7dc:2f4f:17b4 with SMTP id
 46e09a7af769-7e90b3dd22emr6348498a34.21.1781764468073; Wed, 17 Jun 2026
 23:34:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260531010107.1953702-1-safinaskar@gmail.com>
 <20260601-enthusiasmus-canceln-anlehnen-0e62317a9784@brauner>
 <CAHk-=wifX_rrDjRGnDnOqE-usptAukuXKrmuPuVDP5bOCBWzGQ@mail.gmail.com>
 <20260601173325.GH2636677@ZenIV> <83f05c55-efba-4bf5-abfe-d2ab0819e904@packett.cool>
 <CAJnrk1Y9egYizkx1H9K0cqxSYuB+7vLvQbV7Tf4C5eHFqnnC-A@mail.gmail.com>
 <20260617-attest-gewechselt-tragik-7ed473860051@brauner> <CANaxB-zK5q=Xw6UZTmeFtXsDZjUsPkFk=p485m-wtNTBnf4hgg@mail.gmail.com>
In-Reply-To: <CANaxB-zK5q=Xw6UZTmeFtXsDZjUsPkFk=p485m-wtNTBnf4hgg@mail.gmail.com>
From: Andrei Vagin <avagin@gmail.com>
Date: Wed, 17 Jun 2026 23:34:16 -0700
X-Gm-Features: AVVi8CdkTtlsRp3whjFCRdKN_CHwplubM07nLp2T3ItfxHiU3lLc-EI912kwpts
Message-ID: <CANaxB-xVCP5HSUNwphFrKPdW0Qh1pA33A6npac60WArkZMFt7w@mail.gmail.com>
Subject: Re: [PATCH 0/3] vmsplice: make vmsplice a trivial wrapper for preadv2/pwritev2
To: Christian Brauner <brauner@kernel.org>
Cc: Joanne Koong <joannelkoong@gmail.com>, Val Packett <val@packett.cool>, 
	Al Viro <viro@zeniv.linux.org.uk>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Askar Safin <safinaskar@gmail.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-api@vger.kernel.org, netdev@vger.kernel.org, 
	Matthew Wilcox <willy@infradead.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@infradead.org>, David Howells <dhowells@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, Miklos Szeredi <miklos@szeredi.hu>, patches@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.cz>, 
	Steven Rostedt <rostedt@goodmis.org>, fuse-devel <fuse-devel@lists.linux.dev>, 
	Bernd Schubert <bernd@bsbernd.com>, Aleksandr Mikhalitsyn <alexander@mihalicyn.com>, 
	"criu@lists.linux.dev" <criu@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 12:57=E2=80=AFPM Andrei Vagin <avagin@gmail.com> wr=
ote:
>
> On Wed, Jun 17, 2026 at 4:08=E2=80=AFAM Christian Brauner <brauner@kernel=
.org> wrote:
> >
> > > After this patch, step b) is a straight copy which means step d)'s
> > > fixup doesn't modify what's in the pipe. This could be fixed up in
> > > libfuse to not depend on modify-after-vmsplice, but I don't think thi=
s
> > > helps for applications using already-released libfuse versions. I
> > > think this patch needs to be reverted.
> >
> > Note, nothing was merged. I deliberately kept in -next though for a lon=
g
> > time to see how quickly we'd see regressions.
>
> The bait worked. CRIU wins a prize in this lottery.
>
> The CRIU fifo test fails with this change. The problem is that vmsplice
> with SPLICE_F_NONBLOCK to a fifo file descriptor fails with -EOPNOTSUPP.

Actually, this change introduces a performance and functional
regression for CRIU.

Here is a brief overview of how CRIU currently dumps memory pages:

CRIU injects a parasite code blob into the target process's address
space. The parasite invokes vmsplice() with the SPLICE_F_GIFT flag to
pin physical pages directly inside a pipe without copying them. The main
CRIU process then takes over from outside the target context, calling
splice() on the other end of the pipe to stream the data directly into
checkpoint image files or a remote network socket.

I ran a simple test that creates an anonymous mapping and touches every
page within it:
Without this patch, CRIU takes 9 seconds to dump the test process.
With this patch, It takes 18 seconds...

Plus, it obviously introduces some memory overhead.

If these changes are merged, we will need to completely rework the
memory dumping mechanism in CRIU. Using vmsplice() in this proposed form
no longer makes any sense for our architecture...

Thanks,
Andrei
