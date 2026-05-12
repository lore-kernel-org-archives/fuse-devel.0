Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C3439936B
	for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 09:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778577533; cv=pass; b=HVUtED+7cJ13OdJ+lHnUsHyJdvXMFyHHhc+jQJSJ+1T6dFWxXeg+K2/6TTvlzzriyXUzW1eCJyq7zZwKA1dQ9Y7CqH0SlSj5XZI/Wgsse1cJZRroSbYROTusQw7DQ1dUza9exS75jTrI3GjBoOSGFzan/hyQCIz0lfMMaOsxauk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778577533; c=relaxed/simple;
	bh=PejVIfKm6gMA2k7EB+iWymJvu0zxg39FhPOUMOHymSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DhNRuqcq76EChKqYEr+siUE6lHcT9L0bHsoZ5TfDq+ltw+qokKrRw8b9HNkDSbtaUNxgw4WrKuyrKF6czqFrah7tl+6hLdEGHwDuMUDacy7+jJQKKtMndJ0DIyFqtK0JbiT27mqT8mOe6xxg56AaGwIdzqU3yCDimdSbb9cUuNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=rdzWk4sm; arc=pass smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="rdzWk4sm"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8d736211595so374294985a.0
        for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 02:18:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778577531; cv=none;
        d=google.com; s=arc-20240605;
        b=QsYo0La6cjA7s0dtzNodC+QIreJEhZL5vVOYKxwbr8MjcBAWJtPZLJGRGRz5bzkJjc
         n8ERDkWBsX+li/Ffv54W5FHFH03xsuYhpEKGBESQ0SCKAC4Vd4G2nwu8VvIcxNXNFJcI
         kGC+jxLjXO9jg50BdVSsjvoJSPcuEwuwfZ/QvWd2T8PRYkz4sDnWRCwfj8upJVRQJSY+
         cOdFFXjnfKBZENmNM7IIRaI7dhJY576J8EiW5GdRs7g/rCfIB784Z1md+Vqa6bgvwtQK
         lmbUVE9YNNKUpnn814bMEBIGM8oj6FkJZFAN1zCZxnaS6rXptsPP5sKwvQcHdv+a/1W3
         YJgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=86V9k6wlWt9F888GzDwUK4mR1rnUbwmpjgDnqR6kVrA=;
        fh=DBZnAFaXsLzyEG6RQeGyM56KIBPhMpQGxJYWwjzoV8U=;
        b=PmxcfNywlRAKc4hRJhM7lt7lKdpGNsbqvfG77DqMNUzSMIvAvWmDA3qHK8nzH46tHx
         t2Zq4MrtTscAZEksLlRHsWharSXoLBsBHkmNZaVwGT7+K7wwNqXrRMCHPmUGrbqxYHPP
         6IulX9f8ZLk1TU5rztX1DzleS8pxxKZ/kSL58OS1VxXyBqjV2O+1E18YflLBEyiu9f7M
         pNVza2sQx9ZJUhfvYW5pKxUAp7dXwP1gS4EV+xNv+h26GyYWK20IF17pyGNh6RwkcKoM
         bAhX/JhbTRIgVPXgSryD3cXVdIXY6z7EPxTeA210SsQSFpbu2TNePUck8kPEF4xb7Dmi
         /H5w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1778577531; x=1779182331; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=86V9k6wlWt9F888GzDwUK4mR1rnUbwmpjgDnqR6kVrA=;
        b=rdzWk4smXs6zSFzKjtE+xCwV6dDIeBB7OxTq4jQ8tmFi9bmUB+MwrZSsuMq8DnB6va
         cwq4gN3eEjqy638+dL0vTgvXzdw5KBhDdXC//5cFcvPc4Ilc075ynxLeWycP6wTt9oL1
         RZ3gssw2Ct81mUtYGBO35/oBXhh80J+h4tuFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778577531; x=1779182331;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86V9k6wlWt9F888GzDwUK4mR1rnUbwmpjgDnqR6kVrA=;
        b=XWjXj/XKzXP/kGPpZEKZeZ9xPnkMxO6Dr+55GQdJ4UBDVrwSXlnsTa4ydVnnI0ic6p
         XJuQFJukeEk4UWkXA0Xt8abVRl6d4q48e2dZOPzWSxql18KtuM+lOFE2sMdGufWKIX7C
         x2L5e3V3hd2krEWtp21YgbjGg2TUVvovML9Q//Ph0VMT8CxTOTT/WEIbT2qmJAINYNJH
         QO2gGMg0CnES9QsCsKhqADXyHS7NTujHcMAL4fy/ULUtij2LooXe7atKQHNOJ1iAeDu5
         8yjd82UTdbldx+7vjo2mx0QS8yxxiBSQa/eQmOzWEPqgU5FklS15RUMLUeUFlWp1SWfl
         SJiQ==
X-Forwarded-Encrypted: i=1; AFNElJ9IEGMv9Scbx6KYUYvR/i3LYu+gRHyO8RkvUtvoEwrGByoge1i04NsjaZu4R4eIKixmFADe2tac3DWX@lists.linux.dev
X-Gm-Message-State: AOJu0YxsAOXfRhPi9eslJ3dhLSMcCuKwa4SyzVt2eiXj+RU/br2+qEZK
	6OxYrx6cO1BnfDBjHJjGmuMHb+5uyZYt1v7vzVJi+qhgW7dEDM9176GidGPNEpsvzxvpZRAI4c+
	yJXK0TXS9Ew/CxUEXzFslUDD+Ew6+2EPn8eSoK1+adw==
X-Gm-Gg: Acq92OGB/VDdCZfQHyB2oeESrTFC6ZKKYV78LzPQayPgQxzH3vir3fZ8i7I5oU3/Vp7
	mTq2JRUzbdu7P5Kdd6QGvijECh2tCIu5SQ1HY68YoSrMnl+fnzZ74RVRQwmse/JNT9j2FYAwSVA
	//6eVDKajSGSqr631tK4R9MgF38uLZjdAyjG46BrhawP/LxcENl23lDsk1QsNsEhzc7s0KV72H4
	q5q+xx1SaetXC5lPy0bPR6dS43EciHM/QMUx0wJGowuRmdsnPv5FpFrtZU2P3jilrDXQiMK7mcI
	LB3hBujj8pl3/Tr3+DzK0A38bAvXwKdGSEjlaX7TljNxCtXIKw==
X-Received: by 2002:a05:6214:226d:b0:8ac:a5a0:481 with SMTP id
 6a1803df08f44-8bc4249d8c3mr401632546d6.4.1778577530758; Tue, 12 May 2026
 02:18:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260429102058.1362965-1-mszeredi@redhat.com> <CAJnrk1Z_JWtuA3UjucF9=YH63AH_-J_0hzr9jbY99Hx3O8YrAw@mail.gmail.com>
In-Reply-To: <CAJnrk1Z_JWtuA3UjucF9=YH63AH_-J_0hzr9jbY99Hx3O8YrAw@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 12 May 2026 11:18:38 +0200
X-Gm-Features: AVHnY4LY0flrqk7lZiLWgJLEHl0t1ogo3cIM0o-DrODJzYVmHttrDyBRAo6YtLM
Message-ID: <CAJfpegspraqMp1Z3mi_csiw6haawZPa4zWheSUN7MhBy47aYKQ@mail.gmail.com>
Subject: Re: [PATCH] fuse: add fusex filesystem
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 May 2026 at 07:05, Joanne Koong <joannelkoong@gmail.com> wrote:

> Could you explain a bit what the main motivation behind fusex is? Is
> it mainly to clean up interfaces that are now clunky/stale? Or is it
> more driven by limitations in the current codebase that make newer
> features hard to add? From the paragraphs above, it kind of seems like
> the latter?

I think the answer is: both.

Adding new features also hard because the old interface is convoluted
and inconsistent.

> If it's mostly to clean up interfaces that are now clunky/stale, I
> wonder if now is the best time given that, as Amir phrased it in [1],
> "FUSE is experiencing a renaissance of new features and protocol
> enhancements", and I'm not sure if we know yet if these new interfaces
> will also have some things we'll have wished in hindsight we had done
> differently, especially since some of these new features are still
> actively evolving and gaining new capabilities (including io-uring and
> passthrough). Would it make sense to let these new features and
> protocol enhancements evolve and stabilize first before baking them
> into fusex?

Excellent point.

Currently fusex concerns only the filesystem layer, and is agnostic to
the transport layer (except maybe the SYNC_INIT thing).  That doesn't
mean that we shouldn't have the same API cleanup in the transport
layer as well.  For example, I'd love to get rid of splice on
/dev/fuse, which I feel is more burden than blessing.  And I guess
fuse-uring could also do with an API cleanup.

As to when and how this should be done?  I guess that's up to you and
Bernd to decide.

But I feel that we do need to have more high level discussion of APIs,
if we want to avoid repeating past mistakes.

> I wonder if libfuse could serve as a bridge for the gap between legacy
> fuse and fusex, eg libfuse filling any missing gaps / translating
> between legacy fuse protocols and fusex protocols such that any fuse
> server written for legacy fuse could run using fusex, which would
> remove the need to have to do any "backporting" to legacy fuse for new
> features that are added to fusex and could accelerate the deprecation
> timeline of legacy fuse.

Definitely.  However libfuse does export a lot of details from the
kernel API (e.g. INIT flags) that would no longer work with fusex and
not really feasible to emulate with libfuse.  So some porting would be
inevitable.

> Some other things that might be nice:
> * handle_killpriv / handle_killpriv2 - sgid/suid + file capabilities
> clearing will always be handled by the server (default implementation
> in libfuse)

Which is in total contrast to what fusex now does (all that handled by
the VFS).  Need to resolve this sanely somehow.

> * in fuse io-uring: headers and payload passed together as one
> contiguous buffer during registration for pinning, deprecate passing
> separate buffers per SQE

Okay.

> * in passthrough: backing_fd passed at lookup/creation time only (not
> at open time), expanded struct fuse_backing_map

Yes, this needs discussion.  Amir may have additional info on this.

>
> >  - only no-open mode
> >  - new requests:
> >    + FUSE_LOOKUP_ROOT - return nodeid of root
> >    + FUSE_LOOKUPX - FUSE_LOOKUP without the getattr
>
> Could you explain why it's preferred to have lookup disentangled from
> attributes, eg why compounding lookup + attribute fetching is
> preferred over embedding the statx directly inside the lookup request
> without compounding? it was brought up in Luis's lookup handles
> patchset [2] but it's still a bit unclear to me why compounding the
> two is better. I think every operation/request that returns a struct
> fuse_entry_out uses the attributes immediately after through
> fuse_iget(..., &outarg->attr, ...) or fuse_change_attributes(...,
> &outarg.attr, ...),

That's one argument for decoupling: why include the same fields
(attributes, validity) in several ops (LOOKUP_ROOT, LOOKUPX, MKOBJX)
if we already have a separate one to do that?  It simplifies the
protocol.  If we started with decoupled GETATTR, then we wouldn't be
taking about adding these X versions, because it would be a simple
GETATTR -> STATX conversion.

There's also an interesting side effect of coupling STATX with LOOKUP,
which is inherently racy:

Thread A:
send LOOKUP + STATX for /fuse/dir1/filea
[server performs lookup and statx, sends reply]

Thread B:
send SETATTR for /fuse/dir2/fileb, which is hard linked to /fuse/dir1/filea
evict inode for /fuse/dir2/fileb

Thread A:
looks up inode for /fuse/dir1/filea in cache, doesn't find any
creates inode, fills stale attributes

This issue is currently solved with fc->evict_ctr in regular fuse, but
works fine without any additional checks in fusex because of the
decoupled ops.

Of course, it is probably desirable to compound LOOKUP with STATX
despite this, but it gives the implementation more leeway  (e.g. on a
different OS).

To conclude:  separating out STATX from LOOKUPX, etc. makes the protocol:

 a) simpler
 b) more flexible

Thanks,
Miklos
