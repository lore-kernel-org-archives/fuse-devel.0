Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794326407;
	b=1LYNhCRo2JOPIO+qneUu3IRVWH3jafKLSKljUS11DqvY6ip4JY1hhpYG6tgIK2bE+eJP
	 /Ib1awvBitoSyy3ZmxWAwx5i4kAlALQHzS6/OBboSck7KNzlEfpBxAEfacBfMGxCpyBpK
	 LkhOTT6EsFWQ+ovhO89RAqcuw9v3uQ6LNU3/R7O83scQOsO+pXTWGh0vLNg85DrbLLb9a
	 HTTdlOTUqKC6fdsWEENw5/t9hkPp1I7JU+KMnJI5UIIcUbR4qlMUlXGnvlnLHvymhNov+
	 GhixMnldg//UGBi5oDKcgup0yFrLJXuPIQHNcQRM+RWouBnmrnyRu7WPgUCO/y+VNdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=yoTpJiTFsgbbX5VQxcP/im2cD0EvpkANc1CUM3UG8ys=;
	b=BA/vtD/PBHj9v02AjpX5rHexSpyxYgZrvfYLCzojd67i9/vAa8khDDOpxWbiFao2vGv9
	 1YzJYTWA05tErtDT4wEIMzhQe0IXUupZVKsfhR4o7s73OLcpH8moP+DoA3AqY6T5GTwms
	 scEF2w+E99zGJgJoNd+JbN7lEUQy/kubd7zogJghVBdagrvwezOH1wb1d/hmnswlo+t8t
	 pA/vAutKxuLoFWCl/8xawXkB4+6tQEtvVQ6riFeAK9ipUk6aFfmyneWHZ2+SSOcFC+xv1
	 a/sE7IAKaLmadNV+gkJpYhLrBR9XXQijjqb8yEQHDgPv2koQWh59/z/EBOUZ7QokZiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=XHf0Lc2J;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC84606A32D
	for <fuse-devel@lists.linux.dev>; Tue, 10 Nov 2026 16:00:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CC84606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=XHf0Lc2J
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c5059958d61so104577366b.1
        for <fuse-devel@lists.linux.dev>; Tue, 10 Nov 2026 08:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794326404; x=1794931204; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yoTpJiTFsgbbX5VQxcP/im2cD0EvpkANc1CUM3UG8ys=;
        b=XHf0Lc2JeQ9kRKAUJinEk4PatZc4r6LZ1vPuEtNmOea4cfmuvU3oPUyUXHGehMlkQt
         9GxwG1Nu3N9zlSmsbEwPG/UoMx+aObo7dTim2FWnDKG7+ltFZ5+vvBCFG8N3gyoydJfQ
         k9lf88pZWnpwFoviUHPmTcRQ0eYaZVt6zb6WI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794326404; x=1794931204;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yoTpJiTFsgbbX5VQxcP/im2cD0EvpkANc1CUM3UG8ys=;
        b=SDma1ZRZGXEBoUcQjOQWucEM+lNOe+NYr3H5KIgAQYRVEt0tTPu/1aKWorPFKSEanL
         oAPIp2KG5L+/Wv5O/ydsBxg/Cixq21eie2xtPejga3o1r8XyJKRzpAZtAg7AHnxiPpWu
         KQT0pZmJlLzKRh0vjxlJTp3tSivysOPAZzpL92WQ3UhOi9mSMBgJ9Hm0GSWqbJD+qkS7
         OrYcwNZBPE+SOOvVa+l1BuxMnR6qSWgNSyscwy+TkGv4cXAv+w/5J+NdEv7i4LWMMrNn
         sVqGUMD6EVM+5MysD22WUlED9s0Ul//G4FdcLe9HChA4MmggkYX/WB0+85Jtp36Q8486
         KBHQ==
X-Forwarded-Encrypted: i=1; AL+hErFiQ6jO2u+xfORsKB0CLoc5mO81zp7nX/riyMCIxrXAGc2xLvLx1mdIFD/GOs4d0R5XPmr9l52+G44f@lists.linux.dev
X-Gm-Message-State: APuU4Z+yaFAePPs+WMMggMyz9BfZ3TNZECZqk4JQLPOnTUWF3nBFfOBI
	DAQXEJqKwJI+DrsQBw5NO1S6oAAsx1Eywz6dXN5Ugnf7LqbSblyHqZWMP1viEo/sUE0PZ/0JarB
	d2jBUEYY6dw==
X-Gm-Gg: AYBFou1RcjaDcfQP4qYhs6gIxzIKSFvXrWOzj9cCAGb46YBy1Q2KXIS16z8c/TKKNJM
	iPxxZrhEU0VQe72WwfmDtfC0UXQN50jj/v2Oti3ZkKLYrh7kSS6dEz9Emardaw9940bGEe30LBE
	zEZkTdJrGxKoFIR5PSC5Yc2pU64yfaW6SwBDn7PL2WWQ6KU7h7zDBHmTR8V0QkSZPxVEHHQxAtV
	PgeU5ggQ4S5Qh6q4HWGHdm499jEwq4j/SfY8Ay9BT5j7uGoEtX5hrqeBIP94UVjzm6QDuuoieyi
	ICZ4pSEb1hBEbbEb2uhCtoa6v5lzaPx6MXMXMwUeDwa5mg3PqS3l5AeU0hQullD5RZ8Ga2GGGLe
	Hv2VU9zuTeekd9JnHzreeQ8LiAwFiEWNxdgFY/+X8Caww+5V6i+o0Y0EKdEnw+T8jeiJ0pOh8u7
	CGg/YV/WRREBT/HMEjcYEavCWXP8ra0ctpL4W3jPuYYsLoNlBcitah5/J9Ee6eVWc3xFfwJDYI/
	CSxI4CznaQVz3BX6YFL9SaahUMP0spmoXDhWokabcbmPLn/uffepsaURFsxgrr/IlqliUDLg8tp
	k5FkSaD4hiviVJzAfxJBU21Ql4WgfRqRxhHZ9riXLeuTyZaLpZiDyvniDq8b+vHmHhDFxtXCjnp
	E7rk=
X-Received: by 2002:a17:907:3cc5:b0:c4c:a409:5aa3 with SMTP id a640c23a62f3a-c506332ab08mr1644766b.17.1794326404508;
        Tue, 10 Nov 2026 08:00:04 -0800 (PST)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a659860sm121145366b.70.2026.11.10.08.00.04
        for <fuse-devel@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 08:00:04 -0800 (PST)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c5059958d61so104568766b.1
        for <fuse-devel@lists.linux.dev>; Tue, 10 Nov 2026 08:00:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGO5Z2itD3lth82+OxXgsNX7FtrXiCJFw7g/jEGtSmfSDgNSmWflB4b4bD7lKRhg5av+YjBJS+nemxe@lists.linux.dev
X-Received: by 2002:a17:907:1b16:b0:c49:b6db:1 with SMTP id
 a640c23a62f3a-c50633ba346mr907966b.12.1794326403910; Tue, 10 Nov 2026
 08:00:03 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110145241.536019-1-kas@kernel.org>
In-Reply-To: <20261110145241.536019-1-kas@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 10 Nov 2026 07:59:47 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgPq1g-kt_n4-crr0qs3rBNkat5OgLxLLeMjKirevRuSA@mail.gmail.com>
X-Gm-Features: AclHuK-OUBoi1ZcEDjO00AEWOGxItrkKuC6wgZXx5y_lLM7MJshUB6roN-XGzXI
Message-ID: <CAHk-=wgPq1g-kt_n4-crr0qs3rBNkat5OgLxLLeMjKirevRuSA@mail.gmail.com>
Subject: Re: [PATCH 0/4] splice: remove pipe buffer stealing
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Miklos Szeredi <miklos@szeredi.hu>, Amit Shah <amit@kernel.org>, Jan Kara <jack@suse.cz>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Matthew Wilcox <willy@infradead.org>, Zi Yan <ziy@nvidia.com>, 
	Bernd Schubert <bschubert@ddn.com>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Nov 2026 at 06:52, Kiryl Shutsemau (Meta) <kas@kernel.org> wrote:
>
>  11 files changed, 26 insertions(+), 360 deletions(-)

Ack. Lovely. I'm considering just taking this as-is now, rather than
delaying it. Comments?

               Linus
