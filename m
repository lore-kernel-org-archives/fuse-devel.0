Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE5019E819
	for <fuse-devel@lists.linux.dev>; Mon, 18 May 2026 23:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779145963; cv=pass; b=vATDT8O0PPdjlelx9D3XqwS7z4Lgkp+wL0FRsxNwFqNxvecxNPOIrTDhfdnW9XrINqPz6MNvjgxw3Z02S571ciLG86/UfYq/INMwbNIPEmR2KmBBsjHDo2sHOPe0MYD7t82w3zHVJ7sNX8HYLrRoJ9LhXal7O7E6TfHJeS2++yI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779145963; c=relaxed/simple;
	bh=ZUehhhssQIFmaGUQqCT4Xs29swHFCaFH7l6xpHdcYpk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lIxrFTXYeMuGbDVFuntosgvhqkHAq5E/UM3c8E06m79YoLLaT1OwbKTcUJOp8r8u+gICzGxk4pGK7ObELSDrtrAAuUtZgdTS5s/7MzwvdFgufUz+GBLtE19f3eSEjSdXbA+Cygd/a7qnAy40Z7GeDql8Qs6YzNa89UzjE1DwwvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iR3Rtb9L; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iR3Rtb9L"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48d102471a4so22989455e9.2
        for <fuse-devel@lists.linux.dev>; Mon, 18 May 2026 16:12:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779145960; cv=none;
        d=google.com; s=arc-20240605;
        b=iDtEGfl6q92cX8QRzqtZuY675C9l6oIfY8wJsFRKGh3Gi1XU9lkmjThbIuUCp/bgTP
         UCjJdjGk5Xhda7alOcEdmtq9UjW3oSVEzbNdV6gDGQjE/m7B7MwH97wpibeqpZ5nPJ6W
         mKEGYMxc1yO2dL1l//SvM0Giyi3kvOwdhKpMX1PBR78NUqfjffGw9dPccsK/3iKEzLxE
         fT3X+GLIxkj/ZV61XfzRObMbAwmFjmlZrQG/oOccz7l4FXNJ+Y8xEdrewIRS0127d7oK
         8w0uQzdgOPR1rOqE9VRIgUy9rdsFa1Esh1eqo8DKT+RuYyj6XkMyIcUZHhO4GCRREGxj
         NLIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1Ol66b8kKVYZPFuYH6vUoeuCC0cJCNOi44dQnPgvHjg=;
        fh=i2sWQrdp0h5uqr8JkLzVAsxNrOw9hv5pQ43zp0Erw/8=;
        b=gAEWtDZyYr/2z2IzOcuczn7c8PKCp5amCILKo/rKBl2ALAjRYXjJdkd4DuGUbAgySN
         V1SZgh0diuTvXi7T4060Afv5nrf4f4aoJAYb7cbbsv0TUwFQnbOvfM8gizjr+6/+Hm5L
         b+3GlmrMyGEyWsWHgaY0/rrP9f3+hpA8bUWjFmnMSU18a7yHH2caUFYqlvys4oSrFzis
         3IbmuvI/YpewIcZMdM3kAtnFn6paevUQ+G+hiRoOGzR2tbBCwMxS53o9DxXq9jh/rQh4
         lIHEB7ewmmtuZAgU4KFE7+4fWLzXqOdwd5TmuYE0N7v0ksgUrn++adBmMFwg9eXYDJqG
         ZLVQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779145960; x=1779750760; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Ol66b8kKVYZPFuYH6vUoeuCC0cJCNOi44dQnPgvHjg=;
        b=iR3Rtb9LOolSQxxjHmCfq8sZOUI3Sq3JmpB8B+1GqvUkips7jdFx1EbRPyscBtvtXO
         QS2uNNTP3Qp/MFDLi1bgW9jhqvuVhAwEU7uY91rv3yuEltXoQQ7ICEuBUDRjr8AMBi9z
         /OwIUkL/MaW+gQlC8H0YCRkksEY3Na++Whs8GO+sopkgGiFQBiCTI70GgbjR5OYlQos3
         ESPNgjBqNM+8BUrMScklF9S8Hi74LYcVmWSJ5CtuKn1UPqzEGzBKowJok+1akK/7eldJ
         eacrQkihh2waP6I5xhLT1PO3vrrP50EY9UUVDXIHEz96A2pBuznSPgE4+8l0uyAf9zjU
         impA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779145960; x=1779750760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Ol66b8kKVYZPFuYH6vUoeuCC0cJCNOi44dQnPgvHjg=;
        b=B3NgQQar4M+uk3YJwfXEzp5kko1gYgmpDmw9Gf4OkjIEBNWEjs+pM0pCTA/7GEbLMO
         2wBu0hBtvM3eJ+VimHrkplrMxBagq5OFmhO5I+OfyAQV4WbugB+jutZCUvBEyR1Z0Ydu
         b4rwjgNwpNaVfEoK1p/OWEJdo7WFfKWn7qSC0JYhEKREYbahy5F+II9/7Sme0x4Se/Di
         t48W/GSKz/7CQWgG509uqEWByaPoW7oZ/nqwKxAX2odgcm/g4T7nxhOv05wyb/Sgc3Pu
         ezSXYpyGKuSQsiuLaA+9CfoViYrY5SuMYK8CCwMxFkNQGO5fsHYK5K2U3RdufhiFeoSl
         rLeA==
X-Forwarded-Encrypted: i=1; AFNElJ9eUIQZnprG7aQPKr6dmlYVYlMfr5rFKxY8nPMmZta8jQluOT4JeZ62rI2EA+BwsmHr5njvLA6Carm5@lists.linux.dev
X-Gm-Message-State: AOJu0YxlyNGF0yH/Rrwkk8n7oRXdl29cfMeeL9teQuJdOIHw30lEmKlQ
	BVDrcvNzHWP3gvYG/SegEJj1PlqEs2ZuXLyEC4q6deEMZV3o0PfqJ36NtK1zn0WXnmOzYf1kBKs
	WjEb5CVn4asOAMeU93EJZ5k5NRhJoxxyFsq2Q
X-Gm-Gg: Acq92OGhD+uotpK+RZI4AywHdvyeqraDbjklE7v9znR9b8VSht0uVPEq5k5iLVWY//q
	6IbwBjj56AJyjlfq2VtL/Xw6MsGFhOpKLJdAkHWWr+w9WnJGq5wqQzV8DXYLtu7+XbcSbNei+qY
	iTBVsTguOWe/Y7f1PhuN9PVWmfJuIfDgspNSj51/HLrM8JjSYWxBty0CTIz/s4IQ/V1ODIDS+c3
	RHQpnKhnyzzPtO0aWhjFOcQ0N7up71/X5jSryOUHMN0VO7oy0WZw00YGrCT3cRfe4OnRb/WqqS3
	Iexnzw==
X-Received: by 2002:a05:600c:a30a:b0:48e:62ec:f264 with SMTP id
 5b1f17b1804b1-48fe61f29femr207981055e9.17.1779145959932; Mon, 18 May 2026
 16:12:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516004004.1455526-1-joannelkoong@gmail.com>
 <20260516004004.1455526-13-joannelkoong@gmail.com> <CAOQ4uxjMPPp-R37yKoOs1kGUdAOmnp3keVWvfuxi1r8jrxAcTA@mail.gmail.com>
 <agjDGBQPG2WpDTWO@fedora.fritz.box>
In-Reply-To: <agjDGBQPG2WpDTWO@fedora.fritz.box>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 18 May 2026 16:12:26 -0700
X-Gm-Features: AVHnY4Lyu5M_Gh_zQS9q8KGunX9dmEQnO4OzkJ7iWv58OHW2RUtnn_wMfB6yDiM
Message-ID: <CAJnrk1b_55hMTRxtV8QKBqdfEhT_LQK2byat+x-a8Xrj4nicnw@mail.gmail.com>
Subject: Re: Re: [PATCH v2 12/21] fuse: add struct fuse_entry2_out and helpers
 for extended entry replies
To: Horst Birthelmer <horst@birthelmer.de>
Cc: Amir Goldstein <amir73il@gmail.com>, miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-unionfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 12:29=E2=80=AFPM Horst Birthelmer <horst@birthelmer=
.de> wrote:
>
> On Sat, May 16, 2026 at 07:25:05PM +0200, Amir Goldstein wrote:
> > On Sat, May 16, 2026 at 2:52=E2=80=AFAM Joanne Koong <joannelkoong@gmai=
l.com> wrote:
> > >
> > > Add struct fuse_entry2_out, which is a new extended entry reply struc=
t
> > > that carries a backing_id and statx attributes. This will be necessar=
y
> > > for setting fuse passthrough on inodes.
> > >
> > > Add helpers that subsequent commits will use to process fuse_entry2_o=
ut
> > > for passthrough support for lookup, revalidate, and create.
> > > fuse_statx_to_attr() is also moved to earlier in the file to avoid
> > > forward declaring.
> > >
> >
> > I think you had a discussion with Miklos about whether
> > it makes sense to do a compound response for LOOKUP+STATX.
> > I don't remember the conclusion, but if this can save us all the
> > if (use_entry2) { } else {} all over the code, then I think it is worth=
 it.
> >
> > Can you give me the bottom line from your discussion or was there
> > no conclusion reached?

I think the conclusion was that for fusex it will be compounded, but
I'm not sure what Miklos is thinking for fuse.

> >
> > If we do that, where do we return backing_id?
> > Could make use of the reserved[] fields in fuse_statx_out.
> >
> > I happen to have a test patch at the tip of my fuse-backing-inode-wip
> > branch:
> > 6e296625eafd6 fuse: support setting backing inode passthrough on getatt=
r
> >
> > It's not using the statx response, and it was just done for testing,
> > but in theory,
> > if a server wants to  change an inode from non-passthrough to
> > yes-passthrough mid lifetime
> > doing this on attribute cache expiry may make more sense than on entry
> > timeout expiry, because backing_id is an attribute of the inode not the=
 dentry.

I like this idea but I think for supporting yes passthrough -> no
passthrough, it would have to go through an ioctl mechanism since the
getattr could be passed through. In that case, I was thinking it would
be better to have the interfaces be consistent (eg both yes
passthrough -> no passthrough and no passthrough -> yes passthrough go
through an ioctl interface).

I think even with the backing id as part of statx and lookup+statx
compounded together, there would still have to be the "if (use_entry2)
{} else {}" branching logic to handle the new slimmed-down-lookup
differently from old lookup).

>
> Hi Amir,
>
> I see there is a lot of talk about using the compounds in a couple of dif=
ferent contexts.
> I really have to apologize for not having the latest patch ready by now, =
but I'm
> a bit unsure how to do it.
>
> I'm not entirely sure if compounds will only be a thing for fusex or if i=
t will ever
> be accepted for the classic FUSE.

I'm not sure what the plan is either. I think this will get clarified
on Thursday hopefully.

Thanks,
Joanne

>
> I actually have a patch that I have not tested well enough, since I have =
to maintain
> our own version and then have to do the fusex one and probably the new ve=
rison for
> the classic FUSE version.
>
> So, sorry about that, but I'm not having enough clarity on what to focus =
on.
>
> >
> > Not sure if this is making any sense.
> >
> > Thanks,
> > Amir.
> >
>
> Horst
