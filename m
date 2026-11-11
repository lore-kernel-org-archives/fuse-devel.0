Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794425190;
	b=rwrErajQ09+/r4RZ+o0jTynOmg89LyQyZQbRn+0naQ301UxHU6fc5BS/K2NXIajs4N7+
	 l4eQk0Jap7WPCZOG1YC0BK2GhLet4tL9g1IyDTIgFvTYzF7OGBTDxddum9GVPhEbjbiH/
	 mkRrRXSyAbePS214jwAQbLaoKhuGmQkuXuEPpF2rbRLPzSrdHPcaWfFfCtTkREfwD5Wkg
	 26NHVnKo1B3us3z+MuUrtIMLXv1lXP1dpDKxpGPrg1331zSANZJd85IWUPVWkIZ+dcI8r
	 tGGo/LhtpVQfoLCIsNHNuZNOy4gvuf9hGFlQW1qziCUUbxwPaOhWP/wFVGZ+BGhpJ5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794425190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=wd2WluVLwj4r2VIyBQDufDpYxaAOyEu9BCBLHFr84dA=;
	b=KMrWF7QOaoIt/fefO5fCj7vWke1mIGgJ9VUOQ9GI5Xx/eRqDwkASChL6G7e4m/gk6iXf
	 Yk2dtRtv4It7Q/6cXe+0xAQhJFe2UoNwPsrPrbaJ4K2eHjbNbCHpX6MvAjJAPKOE52PcI
	 81ZVBi2PmXPhUJXXsn1b3BTZ8QCAaDHbvPN76y763NZ1jUOXsHao8DDNw2I4JjT3D4Cp3
	 hQ995IG5e1YxAD+e6Sc3L6n8B36tw1r5AlAilCSHYGekhKVOumDdBfDERnj0T/6VuuAFb
	 A1HnkHQPScpHUzFxN3kuKP+vwRniXAm7G53NXjWRbm2qWKnL3us03u+WzIk+HdQ6+MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Be8PLAWY;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB668606A898
	for <fuse-devel@lists.linux.dev>; Wed, 11 Nov 2026 19:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB668606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Be8PLAWY
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c49c32650adso348654166b.0
        for <fuse-devel@lists.linux.dev>; Wed, 11 Nov 2026 11:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794425187; x=1795029987; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wd2WluVLwj4r2VIyBQDufDpYxaAOyEu9BCBLHFr84dA=;
        b=Be8PLAWYwp+iiso8SJhO7vK67xwFlsGr33wX97tizQXADN+HvDRTC8TF7YQMojG/hl
         9xhbjxAwlhqmCylIuwQ+LcDbZeNEYRZXMtQBkRhXlWP8puE3JCgsvv4WuyE4/E69IxKT
         4rup2kEizVbx4BKaR26SgB5YLSJGr3addqC78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794425187; x=1795029987;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wd2WluVLwj4r2VIyBQDufDpYxaAOyEu9BCBLHFr84dA=;
        b=XM/L1ieisF6cys9vbERgGbxb9QLdYFKTI+tFIgpXCvA7R7CifZPNcLJxU6npSXrXtD
         +LDnGhrwQNkCyGBGEyVJvc/+CjQ5SIcWTMOyT1pWcQvmrFKkm8Jg++Hng7/m4SpBRDIa
         td/FWnhAHB0UdHAzyfYLMJXJLsMzNb+uTzBOf71bTWQTis4QzFQWccZ90C1/e2Idamnh
         GYwI5dcRuo0B05Sb9L9JxakMGX/fDZFC4RhRvfnI+JAc6RtciFuUL1a9qbyvHRBWJmOc
         +HGOqKIyt9JgYBumXvL5Izqxd3N3OIzuwred2Wu19nelRDkJdhrX61S7fSX9N5DMWmNI
         0EyQ==
X-Forwarded-Encrypted: i=1; AL+hErGZFM8HhfhXWhVuC2OqikYp31psJV0UdRYnhGceSLKvwwALJQGX01zxZ3ha2zcNWMkcUmwHvx4jmV7Y@lists.linux.dev
X-Gm-Message-State: APuU4Z96uAgIYFKRd7qc7Xr0dfZSZLa0Z7AzejOPle8CcGuAYxUOcjNf
	CWsRfm4TXNEyLKEcqbWI73uU8Rsxv4Ce+U97MLbDKuszWVPyt6Zw1lnBH0q0WHwDF5tr6RFLv/N
	Aer5JnhU=
X-Gm-Gg: AYBFou1kEe8Qn37BCBEzN7RNuAo/MzMNqUZadROX6Y1zlz3MqqLK7ZnKpiCt1MU//UC
	gOGvWWYWWd91bcKUq7BEGROcSk5iJDveb9pUadeshQKdDVLIcGeqmHKHsEDSqPFrqEDf9NKv63w
	vmn9BYQ51ccKZwhw4ADrePow+qkoRBV6nNFBIPDNu6cnn9l+Gx9/oLIRKL+/T7YnlWJFUEd08LJ
	aJRLCIaLp38cjqrjxTD9Vggs5i1SqM8vadVtbfUskNTCnGBIa5jCbyPAuV9n3sykEJZ2ZY679IM
	MIQwa/EQM4F+wKN7rIzzucbbD2/w/DjcH7ppCc/q/FEBrK5E4A/qqk4PcCF8xixfRwVjpirs1x/
	5ntWFNRVCm/GJuNd1LOUX7Hayu44jfLk2/PrgZhd0OdOkk5k9FI2SiyT413OfohkQM9dCH8abg/
	6AHPEBQR9k4Qr+dQ2Jk1/4vNsynCnUuoiBeLZ9QO/hmBNGjqXH5EfXQIHTkrGfWPZUqT6LW4HlT
	aREXp2FO5MtufdJyyz6CfmNsl4kOo6aCWkRHQQDsWyEqZI0pWuSXgmLW20uzgcgSiaAJ9Aa4V5j
	E2brtsf1ne+61l7Ahmze0e+fg2T4yuSWsEQnjv5hsJYUbWvq5OYy1uGuUGATdIy8WB7ezxWgITH
	am40=
X-Received: by 2002:a17:907:72c8:b0:c46:88ef:2e46 with SMTP id a640c23a62f3a-c5066983156mr273407366b.1.1794425187161;
        Wed, 11 Nov 2026 11:26:27 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a5704aasm262324566b.25.2026.11.11.11.26.26
        for <fuse-devel@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:26:27 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b581b6b0e9so2351708a12.2
        for <fuse-devel@lists.linux.dev>; Wed, 11 Nov 2026 11:26:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH7HgeG07tfRxwg8eqGXDDqYLOu3r6ig/7wa+6+KUf5HaEi1XDjU7IFxkmGdQ98OaKdGPXuHeOfBg14@lists.linux.dev
X-Received: by 2002:aa7:d1ca:0:b0:6b5:6478:a9a5 with SMTP id
 4fb4d7f45d1cf-6b7773edf34mr1838418a12.10.1794425186528; Wed, 11 Nov 2026
 11:26:26 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110145241.536019-1-kas@kernel.org> <20261110145241.536019-2-kas@kernel.org>
 <avNuQqLf9CG9dSsE@casper.infradead.org> <20261111-heimreisen-ungeziefer-empfunden-a892571f2c07@brauner>
 <20261111-thunfisch-wirbt-waldrand-822275b2d3b1@brauner> <CAHk-=wjPY=kfgnmtx4COEQjD5UzKx9m2-=KLGAZP4d=RKEH+pg@mail.gmail.com>
 <20261111-stumpf-montag-miterleben-c4e2feac8090@brauner>
In-Reply-To: <20261111-stumpf-montag-miterleben-c4e2feac8090@brauner>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 11 Nov 2026 11:26:09 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjGXBnme-N+HvbzHH40ftb7Suc=kZVT5cuintQWyMHJ7Q@mail.gmail.com>
X-Gm-Features: AclHuK8LZq7-9ajWCZDJwTRjmLDnovqaiY30E_XKr8U-iLvj6BsIi-SShy4XPgk
Message-ID: <CAHk-=wjGXBnme-N+HvbzHH40ftb7Suc=kZVT5cuintQWyMHJ7Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] virtio_console: copy pipe buffers in splice_write()
To: Christian Brauner <brauner@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, "Kiryl Shutsemau (Meta)" <kas@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Miklos Szeredi <miklos@szeredi.hu>, Amit Shah <amit@kernel.org>, 
	Jan Kara <jack@suse.cz>, "David Hildenbrand (Arm)" <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Bernd Schubert <bschubert@ddn.com>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Nov 2026 at 10:53, Christian Brauner <brauner@kernel.org> wrote:
>
> If that's the official new stance than I'm very happy.

I definitely want to remove HIGHMEM entirely in the not too distant
future. And before we remove it, we can most definitely document the
fact that we will not be worried about insane users.

And things like security issues count as "insane user": if you use
HIGHMEM outside of controlled embedded setups or museum pieces you get
to keep both pieces when it breaks.

IOW, it's legacy. We should aim to not introduce *new* bugs to it, but
if there are pre-existing bugs they very much count as "don't care",
this will be removed soon.

I think the only reason it wasn't removed a couple of years ago
already is basically a few old 32-bit ARM platforms that still used
it.

Those platforms still exist, and I predict that they'll still exist
next year, but if those users have to stay at the current LTS kernel,
that's fine.

                  Linus
