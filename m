Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6374331A81C
	for <fuse-devel@lists.linux.dev>; Mon, 18 May 2026 18:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779129586; cv=pass; b=bevs7PeNNhmKj81+UnfuN6PIVy9kbJcKFwyhWtRz2LaGEHWm0ZYSueQph7qN4fQnsmH+vp+u0uN3AdvnOvl4tu3JlYI+PpRULYfqMOpW8TA3gDKJdcAqIoZMaqDZQPjMuC4QsDABNNdAxmuSNhdv/mADx3vynpBKeaYaNOZ27nE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779129586; c=relaxed/simple;
	bh=xCC7AHTEi3ftlT5SE/Ec0E0hK+N0nXWX1qAzoLVrJWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pmItOd683h4VbHZ9bzVxDs8iZ0zujR1/ty9PvsI4qpjgVulaT/oavRySJwWW/HCws40q4X8Bk6DHPNxYP8BzECN4+MI0wjkj1jpfu50qIW4dOJPzCfg7pNOm/CpMIU0CXFOi0aVTHbGR6mXZJ0dYJ8Z+2+4lSjGxCStfNpX7MLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRpu6Jkq; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRpu6Jkq"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bd22b2abaa4so466490966b.0
        for <fuse-devel@lists.linux.dev>; Mon, 18 May 2026 11:39:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779129584; cv=none;
        d=google.com; s=arc-20240605;
        b=Pcdjgwq1YSFI+qjfOWRZkSH7o5u13+L9yF8lACJxBrD/6TgzvMF0eU8KX6Rz/Infhs
         Rmv2n7n77OEQv2v4tkXZGNhAptPhozZsRQxqqcKav57pcdZAthKOJo9ylvryXlb+2EQC
         YXGE6HVeNIq9SjSppjJwLWHg42Ko3L+XpfJhdcj+Z+ac/RCy3zBSYGzDgIs5P9eUhHBs
         CjqRBDV6B+pShJmWICjxU0I4ObEaClarhhploJA8u4FFudq9IwfxbpJYKUmwtBK0y3Rz
         UEnvyTmZ8Wt0wNeiqtwoRKPeKTp1p/Dox2B8imxRSgnPfl5yWqLEpinaLCgg2rr1xf5s
         sP0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j9+DsIOO/UhcsX5Jdn5KmB3aHxjo7tVc/mcyYuxt+ds=;
        fh=5qdpqKZRNhZXUlpC4EdeqGYeenOISEdCwkfxOK+zOw4=;
        b=M1Z4YSv76RMUzi+Vxmua74eEYEx5/CTzocTATwVatx7pjeLyyQkj7Yu84JjRYYuXui
         s20H7i/YiRaI2zxu/Z23kMV+WISa1vqSgpU0Mp1rC6TvXr8OCKlIXivbRMOSUTVFYvWX
         9j1MhfR+vAMZXYutoBeeLJHquY6xXcc4wZ1ugddgAIOm7loHdvqBEiUDqkl+Zyk8ugsM
         /Rs6plLsmritJs07FFjFi8JQTg+aVEW49Tc0TqpRRAnE+waq4gb42BE/euYvp/YGElEv
         e00LvAdZMlAGkP75LEYbmN75wpbd9kJ0llVDF644f0W0uBaKs4Ub+9M4k1pKh9b0gGlT
         2PrA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779129584; x=1779734384; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j9+DsIOO/UhcsX5Jdn5KmB3aHxjo7tVc/mcyYuxt+ds=;
        b=FRpu6JkqTLh6/mQ3kxmXmYNWK4sA3aaXvFzB7hpRQYLzVtWIxIkE3JkcIRzH2x5PEq
         Tb4i44ksaoun6qTqe733eD/8PzAC3haAcORwgyfXsl0H5XE3lsDirzgfXLOPXqWT4bl0
         1n9VI0Tod3tJpszNOuaaDeFKQlrt7+bsUfFwtlHHNtwj7f7sd6C8iZMHDe7XQmvRTdPx
         xtsNRyZHrGyLigDJc73wi+fWZyvBUoXL+RurrM3QB8yke0U04vAmOJPWrlWJgYPLFyX0
         oXLPXwMAdZ3qND7jBXAS50aiKM2X2c0/fHjUyPO06WWkndTMzq90j0niNQLG/yAfCnx5
         NC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779129584; x=1779734384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j9+DsIOO/UhcsX5Jdn5KmB3aHxjo7tVc/mcyYuxt+ds=;
        b=TcehBGeNnrf4v7Vz+5cLpxsv5K7JV0X7WxGbqtyDH9TWtMb63sr3FUVuJV6iHRuQpA
         oWEMkbyeZsxOt1gtpf0F+7fJjnUq+DmVjaRpK9YPfeHtyvf9uYcDv4GfPYYd6nuK5O7I
         T3/xVLo/ONkn+GL11ESy1NyNNAdLHjxrpiwxTYNVCPCRhwU78NatQ72GMFcqtzuRhuKD
         uybLaU+oFjFTMTO1ZuQUis96dsLJPI3YCR6Njj0/xzFQCIsJVdoYPdpxFvFE8kLR71Xg
         XVYYQq2sugOOBqt8dvis/JejsxXyYbl8Z3JMy11X74+FFm5hoHRj2Wd2/VlgK7RiW1hK
         58uA==
X-Forwarded-Encrypted: i=1; AFNElJ+UULOtqrufqMoJAJzV1rjB5ZaCvJoG/F4pog6bTqV173ILT62XUT4OGD6mnC13Qe9VHigyR2ui/QGH@lists.linux.dev
X-Gm-Message-State: AOJu0YwbanxPlglugaE1gjvd2nCrD7U9TDyiLkz2qGfIRqJrXAkwt4Bl
	dCskDmlpMm24wmJhB9q9N8Tc/0ihoXpbhr6GZkpQEm1hTBNlmVf6iOfpzlPzC1+2FHh9uX1cvLM
	v3lk4ZApEV6/LHPYf4AXlceTzwwlLu94=
X-Gm-Gg: Acq92OHqwxBTyVZ8gSeLEpPrpRSW7veNXFLd92lvjhmxvnnnLZ8QounWxnmDRsWczJT
	niQ5tKHaxze9zCZ0eY7NHMyDucsbEkKW7mEYLaH0Y0rK3zZ3pDZLbM8/gzto1MgKItwF5vDsGLw
	R3+FD5GlSUOrJgxH8HgcyBb208tBZHWUS3vpWdsvH4WqDB8XrDXewq1Px+nH001XRkKUBzeynZ5
	j1HQ9BioyhpCRUjmfbad8JNqjusYHpYeUUygtgO2aPihU+B97Br9bEoSZER9P77Hc7kUgSI0uBK
	qo17HCnXTeNyJ/S9qDNedPnfnn/HD2pIUjQqabrg+w==
X-Received: by 2002:a17:907:a317:b0:baf:e47:1b6a with SMTP id
 a640c23a62f3a-bd5179305eamr901579466b.24.1779129583498; Mon, 18 May 2026
 11:39:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516004004.1455526-1-joannelkoong@gmail.com>
 <20260516004004.1455526-3-joannelkoong@gmail.com> <CAJnrk1YUjqd+j1yLXuO0M07ueCUYNC0NqgwmQSm3OiY3hnhgZQ@mail.gmail.com>
 <CAOQ4uxhyZU_6jbv8kY8od_SgG9yQ6aX+KcB2c1um4DajJdSPqA@mail.gmail.com> <CAJnrk1aEc1nf7ax0UvdCi7rkzbWDFpgjJcE35HCQyWcPLdoOnw@mail.gmail.com>
In-Reply-To: <CAJnrk1aEc1nf7ax0UvdCi7rkzbWDFpgjJcE35HCQyWcPLdoOnw@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 18 May 2026 20:39:31 +0200
X-Gm-Features: AVHnY4JsphHHnp2Pz3CHXNh0OLuBHsTbi3fRyxqNZbsPkkAYnNNogJkZfjWHYTw
Message-ID: <CAOQ4uxhUZByYu6hp0TSekZ49FZDp20xPTpG9CmFDjtiTfh8Sgg@mail.gmail.com>
Subject: Re: [PATCH v2 02/21] fuse: prepare for passthrough of inode operations
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-unionfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 8:04=E2=80=AFPM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> On Sat, May 16, 2026 at 9:11=E2=80=AFAM Amir Goldstein <amir73il@gmail.co=
m> wrote:
> >
> > On Sat, May 16, 2026 at 3:34=E2=80=AFAM Joanne Koong <joannelkoong@gmai=
l.com> wrote:
> > >
> > > On Fri, May 15, 2026 at 5:52=E2=80=AFPM Joanne Koong <joannelkoong@gm=
ail.com> wrote:
> > > >
> > > > +/* op bits for fuse_backing_map ops_mask */
> > > > +#define FUSE_PASSTHROUGH_OP_READ       FUSE_PASSTHROUGH_OP(FUSE_RE=
AD)
> > > > +#define FUSE_PASSTHROUGH_OP_WRITE      FUSE_PASSTHROUGH_OP(FUSE_WR=
ITE)
> > >
> > > Do you think we should couple the passthrough op code to the fuse
> > > opcode so closely, instead of defining the passthrough ops separately=
,
> > > eg doing something like this?:
> > >
> > > #define FUSE_PASSTHROUGH_READ         (1 << 0)
> > > #define FUSE_PASSTHROUGH_WRITE       (1 << 1)
> >
> > Don't drop the _OP_ please
> > Need it to distinguish from FUSE_PASSTHROUGH{,_INO}
> > and we need to think if we want to format this as 32bit and extend late=
r
> > or start with a u64 ops_mask format from the start.
> >
> > >
> > > In the (far) future when some more advanced passthrough features get
> > > added (eg full subtree passthrough), it seems like we'd want to add a
> > > passthrough op for that,
> >
> > I don't know. fuse_backing_map has flags, why would we want to put that
> > in ops_mask.
>
> That's a good point, I like your idea of using flags for that.
>
> >
> > > but that wouldn't map to a fuse op. I think
> > > there are also some fuse ops we might skip defining as passthrough op=
s
> > > but are implicitly passed through (eg FUSE_STATX which is covered by
> > > FUSE_GETATTR),
> >
> > This could also become the case with FUSE_CREATE{,_HANDLE}
> > or {FUSE,FUSEX}_CREAT.
> >
> > TBH, the fact that some ops will never be in the mask and
> > that some ops have a canonical bit in itself does not justify creating
> > a different mapping. Do we also want to squeeze the mask into 32bit
> > and leave reserved space? my intuition is to leave it u64.
> >
> > > so it seems more intuitive to define the passthrough
> > > ops as describing capabilities rather than implying that it describes
> > > what specific opcodes get passed through?
> >
> > hmm. I guess you have a point that it is a bit limiting to commit
> > to this arithmetic in UAPI.
> >
> > My thinking behind this was ease of use with these helpers:
> >
> >        if (!fuse_passthrough_op(file_inode(in), FUSE_READ))
> >
> > but those could just as well be macros:
> >
> > static inline bool fuse_inode_passthrough_op(struct inode *inode,
> >                                             u64 opbit)...
> >
> > #define FUSE_PASSTHROUGH_OP(inode, opname)    \
> >              fuse_passthrough_op(inode, FUSE_PASSTHROUGH_OP_ ## opname)
> >
> > #define FUSE_BACKING_MAP_OP(map, opname) \
> >        ((map)->ops_mask & FUSE_PASSTHROUGH_OP ## opname))
> >
> > ...
> >        if (!FUSE_PASSTHROUGH_OP(file_inode(in), READ))
> >
> > wdyt?
>
> Nice, the macro idea is neat!
>
> I feel like it gives more flexibility to define it separately and I
> think with that, u32 would be more than enough bits as well. But I'm
> happy to go with what you think would be better here.

I am not sure. Let's keep it u64 for now.
Since the struct is in an ioctl, it does not really matter much.
If we ever consider moving backing_map responses inline
in lookup/readdirplus response (maybe over io uring) we could reconsider.

In case you missed the exciting conversations about this API
original fuse passthough patches from Android had the backing fd
in the open response but it was deemed unsafe writing fds to
/dev/fuse, so ioctl was chosen instead [1].

With io_uring I don't think the security concern holds, so I see no reason
why backing_map would not be possible in-place for readdirplus
responses if we wanted to do that, but we can also ignore all this for now.

Thanks,
Amir.

[1] https://lore.kernel.org/linux-fsdevel/CAG48ez3ZX8R9kRAQhung2_e3wjowu5cP=
h7WL3U866mkga-kftQ@mail.gmail.com/
